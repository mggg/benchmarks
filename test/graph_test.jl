include("../test.jl")
using GerryChain
using Test

@testset "Loading a graph" begin
    @testset "2x2 graph" begin
        graph = load_graph_from_edge_list("data/2x2_grid.dat", "data/2x2_grid_weight.dat")
        @test graph.num_nodes == 4
        @test graph.num_edges == 4
        @test graph.populations == [1, 2, 4, 8]
        @test graph.total_pop == 15
        @test graph.adj_matrix == [0 1 2 0; 1 0 0 3; 2 0 0 4; 0 3 4 0]
        @test graph.neighbors == [[2, 3], [1, 4], [1, 4], [2, 3]]
    end
    @testset "2x2 triangular lattice" begin 
        graph = load_graph_from_edge_list("data/2x2_triangular_lattice.dat", "data/2x2_triangular_lattice_weight.dat")
        @test graph.num_edges == 9
        @test graph.num_nodes == 6
        @test graph.populations == [1, 2, 4, 8, 10, 12]
        @test graph.total_pop == 37
        @test graph.neighbors == [[2, 3], [1, 3, 4], [1, 2, 4, 5, 6], [2, 3, 6], [3,6], [3, 4, 5]]
    end 
    @testset "6x6 grid" begin 
        graph = load_graph_from_edge_list("data/6x6_grid.dat", "data/6x6_grid_weight.dat")
        @test graph.num_edges == 60
        @test graph.num_nodes == 36
        @test graph.populations == collect(1:36)
        @test graph.total_pop == sum(collect(1:36))
    end 
    @testset "Disconnected graph" begin 
        @test_throws ArgumentError load_graph_from_edge_list("data/6x6_disconnected_grid.dat", "data/6x6_grid_weight.dat")
    end
end
