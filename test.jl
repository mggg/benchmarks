using GerryChain
using LightGraphs
using PyPlot
using LinearAlgebra

"""
    load_graph_from_edge_list(graph_file_path::String, weight_file_path::String)

Construct basegraph object using a graph file and a weight file.
Graph file describes basic structure of graph using edge list.
Weight file stores population assigned to each node

# Examples
```julia-repl
julia> load_graph_from_edge_list("graph.dat", "weight.dat")
BaseGraph(4, 4, 15, [1, 2, 4, 8], 
 ⋅  1  2  ⋅
 1  ⋅  3  4
 2  3  ⋅  ⋅
 ⋅  4  ⋅  ⋅, [1, 1, 2, 2], [2, 3, 3, 4], [[2, 3], [1, 3, 4], [1, 2], [2]], {4, 4} undirected simple Int64 graph, Dict{String, Any}[])

```
"""
function load_graph_from_edge_list(graph_file_path::String, weight_file_path::String)

    graph, edge_list = open(graph_file_path) do file
        edge_list = []
        nodes = Set()
        for ln in eachline(file)
            ln = split(ln)
            first = parse(Int64,ln[1])
            second = parse(Int64,ln[2])
            push!(edge_list,[first,second])
            push!(nodes, first)
            push!(nodes, second)
        end
        if nodes != Set(1:length(nodes))
            throw(ArgumentError("Error loading input graph. Graph must be connected"))
        end
        graph = SimpleGraph(length(nodes))
        return graph, edge_list
    end 
        
    for i in edge_list
        add_edge!(graph, i[1], i[2])
    end        
    
    edge_src, edge_dst = GerryChain.edges_from_graph(graph)
    adj_matrix = GerryChain.adjacency_matrix_from_graph(graph)
    neighbors = GerryChain.neighbors_from_graph(graph)   

    total_population, populations = open(weight_file_path) do file
        node_populations = []
        weights = read(file, String)
        weights = split(weights)
        for i in weights
            push!(node_populations, parse(Int64,i))
        end
        return sum(node_populations), node_populations
    end

    return BaseGraph(
    nv(graph),
    ne(graph),
    total_population,
    populations,
    adj_matrix,
    edge_src,
    edge_dst,
    neighbors,
    graph,
    [],
    )
end


"""
    load_partition_from_line(graph, assignments::String)::Partition

Load a partition from one assignment
Numbers in the assignment string correspond to the part that node is assigned to
Use BaseGraph generated by load_graph_from_edge_list()

# Examples
```julia-repl
julia> load_partition_from_line(BaseGraph, "0 1 1 1")
Partition(2, 2, [1, 2, 2, 2], [1, 14], [1, 1, 0, 0], 
 ⋅  2
 2  ⋅, BitSet[BitSet([1]), BitSet([2, 3, 4])], nothing)

```
"""
function load_partition_from_line(graph, assignments::String)::Partition
    populations = graph.populations
    assignments_string = split(assignments)
    assignments = zeros(Int64, length(assignments_string))
    districts = [] 

    for i in eachindex(assignments_string)
        district_id = parse(Int64, assignments_string[i])
        assignments[i] = district_id
        if !(district_id in districts)
            push!(districts, district_id)
        end
    end 
    
    sort!(districts)
    
    # districts are reassigned to 1 -> n-1 following the original order
    reassign_district = Dict(zip(districts, 1:length(districts)))  
    for i in eachindex(assignments)
        assignments[i] = reassign_district[assignments[i]]
    end 

    num_districts = length(districts)
    
    # get cut_edges, district_adjacencies
    dist_adj, cut_edges = GerryChain.get_district_adj_and_cut_edges(graph, assignments, num_districts)
    num_cut_edges = sum(cut_edges)  
    # get district populations
    dist_populations =
        get_district_populations(assignments, populations, graph.num_nodes, num_districts)
    # get district_nodes
    dist_nodes = get_district_nodes(assignments, graph.num_nodes, num_districts)
    # return Partition with no parent by default
    return Partition(
        num_districts,
        num_cut_edges,
        assignments,
        dist_populations,
        cut_edges,
        dist_adj,
        dist_nodes,
        nothing,
    )

end

function spanning_tree_distribution(graph, enum_file::String)
    cut_edges = Dict{Int64,Float64}()
    lines = 0
    cut_edges, total_score = open(enum_file) do file
        for line in eachline(file)
            lines += 1 
            partition = load_partition_from_line(graph,line)
            score = 1 
            for district in partition.dist_nodes
                vlist = Vector{Int64}()
                for k in district
                    push!(vlist, k)
                end
                subgraph, vector = LightGraphs.induced_subgraph(graph.simple_graph, vlist)
                L = LightGraphs.laplacian_matrix(subgraph)
                L = L[1:end .!= 1, 1:end .!= 1]
                spanning_tree = det(L)
                score *= spanning_tree
            end
            if partition.num_cut_edges in keys(cut_edges)
                cut_edges[partition.num_cut_edges] += score
            else 
                cut_edges[partition.num_cut_edges] = score
            end
        end
        return cut_edges, sum(values(cut_edges))
    end
    return Dict(k => v / total_score for (k, v) in cut_edges)
end


function calculate_benchmark(graph, enum_file::String, benchmark_type::String)::Dict
    result = Dict{Int64,Int64}()
    enumeration = open(enum_file) do file
        for ln in eachline(file)
            partition = load_partition_from_line(graph, ln)
            cut_edge = partition.num_cut_edges
            if cut_edge in keys(result)
                result[cut_edge] += 1 
            else 
                result[cut_edge] = 1 
            end
        end
    end
    return result
end

"""
    plot_distribution(results)

Plot the summary benchmarks that we need.
Results is a dictionary with count of each benchmark level

# Examples
```julia-repl
julia> plot_distribution(results)
1
```
"""
function plot_distribution(results)
    pygui(true)
    x = [key for key in keys(results)]
    print(typeof(x))
    y = [value for value in values(results)]
    print(typeof(y))
    fig = figure(figsize = (10, 5))
    bar(x, y, color ="maroon",
        width = 0.4, alpha = 0.3)
    title("Cut Edges")
    show()
end 
