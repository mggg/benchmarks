include("../test.jl")
using GerryChain
using Test

@testset "Loading a graph" begin
    @testset "2x2 grid" begin
        graph = load_graph_from_edge_list("data/2x2_grid.dat", "data/2x2_grid_weight.dat")
        @test graph.num_nodes == 4
        @test graph.num_edges == 4
        @test graph.populations == [1, 2, 4, 8]
        @test graph.total_pop == 15
    end
    @testset "2x2 triangular lattice" begin 
        graph = load_graph_from_edge_list("data/2x2_triangular_lattice.dat", "data/2x2_triangular_lattice_weight.dat")
        @test graph.num_edges == 9
        @test graph.num_nodes == 6
        @test graph.populations == [1, 2, 4, 8, 10, 12]
        @test graph.total_pop == 37
    end 
end
