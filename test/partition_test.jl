include("../test.jl")
using GerryChain
using Test


@testset "Loading a partition" begin
    graph = load_graph_from_edge_list("data/2x2_grid.dat", "data/2x2_grid_weight.dat")
    @testset "two districts" begin
        partition = load_partition_from_line(graph,"0 1 1 1")
        @test partition.num_dists == 2 
        @test partition.num_cut_edges == 2 
        @test partition.assignments == [1, 2, 2, 2]
        @test partition.dist_populations == [1, 14]
    end
    @testset "three districts" begin
        partition = load_partition_from_line(graph,"0 2 1 1")
        @test partition.num_dists == 3 
        @test partition.num_cut_edges == 4
        @test partition.assignments == [1, 3, 2, 2]
        @test partition.dist_populations == [1, 12, 2]
    end
    @testset "reassign district id" begin
        partition = load_partition_from_line(graph,"5 6 5 5")
        @test partition.num_dists == 2
        @test partition.num_cut_edges == 3
        @test partition.assignments == [1, 2, 1, 1]
    end
end