using GerryChain
using LightGraphs
using PyPlot
using LinearAlgebra
using StatsBase


"""
    load_graph_from_edge_list(graph_file_path::String, weight_file_path::String)

Construct basegraph object using a graph file and a weight file.
Graph file describes basic structure of graph using edge list.
Weight file stores population assigned to each node

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

"""
function load_partition_from_line(graph, assignments::String)::Partition
    populations = graph.populations
    if occursin(",", assignments)
        input = split(assignments, ",")
        weight = input[1]
        assignments_string = input[2:end]
        for i in eachindex(assignments_string)
            assignments_string[i] = strip(assignments_string[i], [' ', '[', ']'])
        end
    else
        assignments_string = split(assignments)
    end
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


"""
    spanning_tree_distribution(graph, enum_file::String)::Dict

Calculate spanning tree distribution of a full enumeration

"""
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


"""
    calculate_benchmark(graph, benchmark_type::String)::Dict

Calculate the desired benchmark (cut edges, etc.) for input enumeration 
Output a dictionary of summary statistics

"""
function calculate_benchmark(graph, benchmark_type)::Dict
    @assert benchmark_type == "cut_edges" "Only the `cut_edges` benchmark is currently implemented"
    result = Dict{Int64,Int64}()
    for ln in eachline(stdin)
    	if occursin(",", ln)
            partition = load_partition_from_line(graph, ln)
            cut_edge = partition.num_cut_edges
            if cut_edge in keys(result)
                result[cut_edge] += 1 
            else 
                result[cut_edge] = 1  
            end
	    end
        println(result)
    end
    sum_values = sum(values(result))
    return Dict(k => v / sum_values for (k, v) in result)
end

"""
    calculate_Kullback_Leibler_distance(target, test)

Calculate the Kullback Leibler distance between the target distribution and the testing distribution
Input: dictionary output from calculate_benchmark and spanning_tree_distribution

"""
function calculate_Kullback_Leibler(target, test)
    p = sort(collect(keys(target)))
    q = collect(keys(test))
    final_q = zeros(Int64, length(p))
    for (index, value) in enumerate(p)
        if value in q
            final_q[index] = value
        else
            final_q[index] = 0.0001
        end
    end 
    for value in q
        if !(value in p)
            push!(final_q, value)
            push!(p, 0.0001)
        end 
    end
    kl = StatsBase.kldivergence(p, final_q)
    return kl
end 


"""
    plot_distribution(results, color)

Plot the summary benchmarks that we need.
Results is a dictionary with count of each benchmark level

"""
function plot_distribution(results, color = "maroon")
    pygui(true)
    x = [key for key in keys(results)]
    y = [value for value in values(results)]
    bar(x, y, color = color, width = 0.4, alpha = 0.3)
    title("Cut Edges")
end 
