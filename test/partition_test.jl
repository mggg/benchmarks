include("../test.jl")
using GerryChain
using Test

graph = load_graph_from_edge_list("data/graph.dat", "data/weight.dat")
partition = load_partition_from_line(graph,"0 1 1 1")

@testset "Loading a partition" begin
    @testset "0 1 1 1" begin
        @test partition.num_districts = 2 
        @test partition.assignments = [1, 2, 2, 2]
        @test partition.dist_populations [1, 14]
    end
end