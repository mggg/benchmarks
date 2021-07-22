include("../test.jl")
using GerryChain
using Test



@testset "Loading a partition" begin
    @testset "0 1 1 1" begin
        graph = load_graph_from_edge_list("data/2x2_grid.dat", "data/2x2_weight.dat")
        partition = load_partition_from_line(graph,"0 1 1 1")
        @test partition.num_districts = 2 
        @test partition.assignments = [1, 2, 2, 2]
        @test partition.dist_populations [1, 14]
    end
end