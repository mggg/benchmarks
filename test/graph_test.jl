include("../test.jl")
using GerryChain
using Test

@testset "Loading a graph" begin
    @testset "2x2 graph" begin
        graph = load_graph_from_edge_list("data/graph.dat", "data/weight.dat")
        @test graph.num_nodes == 4
        @test graph.num_edges == 4
        @test graph.populations == [1, 2, 4, 8]
        @test graph.total_pop == 15
    end
end
