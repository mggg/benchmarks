using GerryChain
using LightGraphs
using PyPlot
# use x = linspace(0,2*pi,1000) in Julia 0.6

#Write a function to load in a row from enumpart’s output as a GerryChain.jl Partition.


# Step 1: Initialize a simple graph 
    # needs number of nodes 
    # add each edge to the graph 
    # add population from weight file
# Step 2: Initialize a basegraph 
# Step 3: Initialize a partition
    # needs base graph, assignment 
    # assignment::Array{Int,1} assignment for each node in the graph 

    


function load_graph_from_edge_list(graph_file_path::String, weight_file_path::String)

    nums_node = 0
    total_population, populations = open(weight_file_path) do file
        total = 0
        node_populations = []
        weights = read(file, String)
        weights = split(weights)
        for i in weights
            curr_population = parse(Int64,i)
            total += curr_population
            push!(node_populations,curr_population)
        end
        return total, node_populations
    end


    graph, edge_list = open(graph_file_path) do file
        edge_list = []
        for ln in eachline(file)
            first = parse(Int64,ln[1])
            second = parse(Int64,ln[3])
            push!(edge_list,[first,second])
            if max(first, second) > nums_node
                nums_node = max(first, second)
            end     
        end
        simple_graph = SimpleGraph(nums_node)
        return simple_graph, edge_list
    end 
        
    for i in edge_list
        add_edge!(graph, i[1], i[2])
    end        
    
    edge_src, edge_dst = GerryChain.edges_from_graph(graph)
    adj_matrix = GerryChain.adjacency_matrix_from_graph(graph)
    neighbors = GerryChain.neighbors_from_graph(graph)   

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

graph = load_graph_from_edge_list("enumpart/graph.dat", "enumpart/weight.dat")


function load_partition_from_line(graph, assignments::String)::Partition
    populations = graph.populations
    assignments_string = split(assignments)
    assignments = zeros(Int64, length(assignments_string))
    for i in eachindex(assignments_string)
        assignments[i] = parse(Int64, assignments_string[i])+1
    end
    num_districts = length(Set(assignments))
    
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

load_partition_from_line(graph, "0 1 1 1")

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
    println("pass")
end 

plot_distribution(Dict(30 => 29034, 29 => 79788, 28 => 114402, 27 => 102200,
                 26 => 69156, 25 => 34424, 24 => 15748, 23 => 4400, 22 => 1804, 
                 20 => 120, 21 => 128, 18 => 2))