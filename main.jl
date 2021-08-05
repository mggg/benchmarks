using ArgParse
include("./test.jl")


"""
    parse_commandline()

Parse arguments from command line.

"""
function parse_commandline()
    s = ArgParseSettings()

    @add_arg_table s begin
        "--graph-file"
            help = "graph file path"
            required = true
        "--pop-file"
            help = "population file path"
            required = true
        "-p"
            help = "plot results"
            action = :store_true
        "--enum-file"
            help = "all possible enumeration of original graph"
        "--benchmark"
            help = "type of benchmark to calculate. Default type is cut edges"
            default = "cut_edge"
        "--metric-kl"
            help = "Compute the Kullback-Leibler divergence between two distributions"
            default = 0
    end

    return parse_args(s)
end


function main()
    parsed_args = parse_commandline()
    graph = load_graph_from_edge_list(parsed_args["graph-file"], parsed_args["pop-file"])
    test_enumeration = calculate_benchmark(graph, parsed_args["benchmark"])
    spanning_tree = spanning_tree_distribution(graph, parsed_args["enum-file"])
    if parse(Int64, parsed_args["metric-kl"]) > 0
        kl = calculate_Kullback_Leibler(spanning_tree, test_enumeration)
        println(kl)
        # not done yet
        if kl > parse(Int64, parsed_args["metric-kl"]) 
            error("Maximum distance exceeded")
        end 
    end 
    if parsed_args["p"]
        fig = figure(figsize = (10, 5))
        plot_distribution(test_enumeration, "maroon")  
        plot_distribution(spanning_tree, "blue")
        show() 
    end
end

main()
