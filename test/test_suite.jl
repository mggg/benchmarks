# Assignment data for each test we run
six_by_nine_two_dists = "1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0"
six_by_nine_two_dists_assignment = [2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1]
six_by_nine_three_dists = "0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2"
six_by_nine_three_dists_assignment =  [1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3]
six_by_nine_reassignment_two_dists = "5 5 5 6 6 6 5 5 5 6 6 6 5 5 5 6 6 6 5 5 5 6 6 6 5 5 5 6 6 6 5 5 5 6 6 6 5 5 5 6 6 6 5 5 5 6 6 6 5 5 5 6 6 6"
six_by_nine_reassignment_assignment = [1, 1, 1, 2, 2, 2, 1, 1, 1, 2, 2, 2, 1, 1, 1, 2, 2, 2, 1, 1, 1, 2, 2, 2, 1, 1, 1, 2, 2, 2, 1, 1, 1, 2, 2, 2, 1, 1, 1, 2, 2, 2, 1, 1, 1, 2, 2, 2, 1, 1, 1, 2, 2, 2]

dumbbell_two_dists = "1 1 1 1 1 1 1 1 0 0 0 0 0 0 0 0 0"
dumbbell_two_dists_assignment = [2, 2, 2, 2, 2, 2, 2, 2, 1, 1, 1, 1, 1, 1, 1, 1, 1]
dumbbell_three_dists = "0 0 0 0 0 0 1 1 1 1 1 2 2 2 2 2 2"
dumbbell_three_dists_assignment = [1, 1, 1, 1, 1, 1, 2, 2, 2, 2, 2, 3, 3, 3, 3, 3, 3]
dumbbell_reassignment_two_dists = "6 6 6 6 5 5 5 5 5 5 5 5 5 5 5 5 5"
dumbbell_reassignment_assignment = [2, 2, 2, 2, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1]

petersen_two_dists = "0 0 0 0 0 1 1 1 1 1"
petersen_two_dists_assignment = [1, 1, 1, 1, 1, 2, 2, 2, 2, 2]
petersen_three_dists = "0 0 0 1 1 2 0 2 1 2"
petersen_three_dists_assignment = [1, 1, 1, 2, 2, 3, 1, 3, 2, 3]
petersen_reassignment_two_dists = "0 0 0 1 1 0 0 1 1 1"
petersen_reassignment_assignment = [1, 1, 1, 2, 2, 1, 1, 2, 2, 2]

tuttes_fragment_two_dists = "0 0 0 0 0 0 0 0 0 1 1 1 1 1 1 1 1 1"
tuttes_fragment_two_dists_assignment = [1, 1, 1, 1, 1, 1, 1, 1, 1, 2, 2, 2, 2, 2, 2, 2, 2, 2]
tuttes_fragment_three_dists = "0 0 0 0 0 0 1 1 1 1 1 1 2 2 2 2 2 2"
tuttes_fragment_three_dists_assignment = [1, 1, 1, 1, 1, 1, 2, 2, 2, 2, 2, 2, 3, 3, 3, 3, 3, 3]
tuttes_fragment_reassignment_two_dists = "5 5 5 5 5 5 6 6 6 6 5 6 6 5 6 6 5 6"
tuttes_fragment_reassignment_assignment = [1, 1, 1, 1, 1, 1, 2, 2, 2, 2, 1, 2, 2, 1, 2, 2, 1, 2]

young_fibonacci_two_dists = "1 1 0 0 0 1 0 0 0 1 1 1"
young_fibonacci_two_dists_assignment = [2, 2, 1, 1, 1, 2, 1, 1, 1, 2, 2, 2]
young_fibonacci_three_dists = "0 0 0 0 0 1 1 1 1 2 2 2"
young_fibonacci_three_dists_assignment = [1, 1, 1, 1, 1, 2, 2, 2, 2, 3, 3, 3]
young_fibonacci_reassignment_two_dists = "5 5 5 5 5 5 6 6 6 6 6 6"
young_fibonacci_reassignment_assignment = [1, 1, 1, 1, 1, 1, 2, 2, 2, 2, 2, 2]

# Partition Tests

@testset "Loading a partition" begin

    @testset "2x2 grid" begin
        two_by_two_grid = load_graph_from_edge_list("data/2x2_grid.dat", "data/2x2_grid_weight.dat")
        @testset "two districts" begin
            partition = load_partition_from_line(two_by_two_grid,"0 1 1 1")
            @test partition.num_dists == 2 
            @test partition.num_cut_edges == 2 
            @test partition.assignments == [1, 2, 2, 2]
            @test partition.dist_populations == [1, 14]
        end
        @testset "three districts" begin
            partition = load_partition_from_line(two_by_two_grid,"0 2 1 1")
            @test partition.num_dists == 3 
            @test partition.num_cut_edges == 3
            @test partition.assignments == [1, 3, 2, 2]
            @test partition.dist_populations == [1, 12, 2]
        end
        @testset "reassign district id" begin
            partition = load_partition_from_line(two_by_two_grid,"5 6 5 5")
            @test partition.num_dists == 2
            @test partition.num_cut_edges == 2
            @test partition.assignments == [1, 2, 1, 1]
        end
    end
    
    @testset "2x2 triangular lattice" begin
        two_by_two_triangular_lattice = load_graph_from_edge_list("data/2x2_triangular_lattice.dat", "data/2x2_triangular_lattice_weight.dat")
        @testset "two districts" begin
            partition = load_partition_from_line(two_by_two_triangular_lattice,"0 0 0 1 1 1")
            @test partition.num_dists == 2
            @test partition.num_cut_edges == 4
            @test partition.assignments == [1, 1, 1, 2, 2, 2]
            @test partition.dist_population == [7, 30]
        end
        @testset "three districts" begin
            partition = load_partition_from_line(two_by_two_triangular_lattice,"1 2 1 2 0 0")
            @test partition.num_dists == 3
            @test partition.num_cut_edges == 6
            @test partition.assignments == [2, 3, 2, 3, 1, 1]
            @test partition.dist_populations == [22, 5, 10]
        end
        @testset "reassign district id" begin
            partition = load_partition_from_line(two_by_two_triangular_lattice,"5 6 5 6 5 5")
            @test partition.num_dists == 2
            @test partition.num_cut_edges == 4
            @test partition.assignments == [1, 2, 1, 2, 1, 1]
        end
    end
    
    @testset "6x9 grid" begin
        six_by_nine_grid = load_graph_from_edge_list("data/6x9_grid.dat", "data/6x9_grid_weight.dat")
        @testset "two districts" begin
            partition = load_partition_from_line(six_by_nine_grid, six_by_nine_two_dists)
            @test partition.num_dists == 2
            @test partition.num_cut_edges == 7
            @test partition.assignments == six_by_nine_two_dists_assignment
            @test partition.dist_populations == [1107, 378]
        end
        @testset "three districts" begin
            partition = load_partition_from_line(six_by_nine_grid, six_by_nine_three_dists)
            @test partition.num_dists == 3
            @test partition.num_cut_edges == 12
            @test partition.assignments == six_by_nine_three_dists_assignment
            @test partition.dist_populations == [171, 495, 819]
        end
        @testset "reassign district id" begin
            partition = load_partition_from_line(six_by_nine_grid, six_by_nine_reassignment_two_dists)
            @test partition.num_dists == 2
            @test partition.num_cut_edges == 9
            @test partition.assignments == six_by_nine_reassignment_assignment
        end
    end
    
    @testset "Dumbbell weight middle" begin
        dumbbell = load_graph_from_edge_list("data/dumbbell.dat", "data/dumbbell_weight_middle.dat")
        @testset "two districts" begin
            partition = load_partition_from_line(dumbbell, dumbbell_two_dists)
            @test partition.num_dists == 2
            @test partition.num_cut_edges == 1
            @test partition.assignments == dumbbell_two_dists_assignment
            @test partition.dist_populations == [24, 18] 
        end
        @testset "three districts" begin
            partition = load_partition_from_line(dumbbell, dumbbell_three_dists)
            @test partition.num_dists == 3
            @test partition.num_cut_edges == 6
            @test partition.assignments == dumbbell_three_dists_assignment
            @test partition.dist_populations == [12, 18, 12] 
        end
        @testset "reassign district id" begin
            partition = load_partition_from_line(dumbbell, dumbbell_reassignment_two_dists)
            @test partition.num_dists == 2
            @test partition.num_cut_edges == 5
            @test partition.assignments == dumbbell_reassignment_assignment
        end
    end
    
    @testset "Dumbbell weight sides" begin
        dumbbell = load_graph_from_edge_list("data/dumbbell.dat", "data/dumbbell_weight_sides.dat")
        @testset "two districts" begin
            partition = load_partition_from_line(dumbbell, dumbbell_two_dists)
            @test partition.num_dists == 2
            @test partition.num_cut_edges == 1
            @test partition.assignments == dumbbell_two_dists_assignment
            @test partition.dist_populations == [44, 41]
        end
        @testset "three districts" begin
            partition = load_partition_from_line(dumbbell, dumbbell_three_dists)
            @test partition.num_dists == 3
            @test partition.num_cut_edges == 6
            @test partition.assignments == dumbbell_three_dists_assignment
            @test partition.dist_populations == [34, 18, 33] 
        end
        @testset "reassign district id" begin
            partition = load_partition_from_line(dumbbell, dumbbell_reassignment_two_dists)
            @test partition.num_dists == 2
            @test partition.num_cut_edges == 5
            @test partition.assignments == dumbbell_reassignment_assignment
        end
    end
    
    @testset "Petersen" begin
        petersen = load_graph_from_edge_list("data/petersen.dat", "data/petersen_weight.dat")
        @testset "two districts" begin
            partition = load_partition_from_line(petersen, petersen_two_dists)
            @test partition.num_dists == 2
            @test partition.num_cut_edges == 5
            @test partition.assignments == petersen_two_dists_assignment
            @test partition.dist_populations == [15, 5]
        end
        @testset "three districts" begin
            partition = load_partition_from_line(petersen, petersen_three_dists)
            @test partition.num_dists == 3
            @test partition.num_cut_edges == 8
            @test partition.assignments == petersen_three_dists_assignment
            @test partition.dist_populations == [10, 7, 3]
        end
        @testset "reassign district id" begin
            partition = load_partition_from_line(petersen, petersen_reassignment_two_dists)
            @test partition.num_dists == 2
            @test partition.num_cut_edges == 7
            @test partition.assignments == petersen_reassignment_assignment
        end
    end
    
    @testset "Tuttes fragment" begin
        tuttes_fragment = load_graph_from_edge_list("data/tuttes_fragment.dat", "data/tuttes_fragment_weight.dat")
        @testset "two districts" begin
            partition = load_partition_from_line(tuttes_fragment, tuttes_fragment_two_dists)
            @test partition.num_dists == 2
            @test partition.num_cut_edges == 5
            @test partition.assignments == tuttes_fragment_two_dists_assignment
            @test partition.dist_populations == [57, 61]
        end
        @testset "three districts" begin
            partition = load_partition_from_line(tuttes_fragment, tuttes_fragment_three_dists)
            @test partition.num_dists == 3
            @test partition.num_cut_edges == 8
            @test partition.assignments == tuttes_fragment_three_dists_assignment
            @test partition.dist_populations == [42, 34, 42]
        end
        @testset "reassign district id" begin
            partition = load_partition_from_line(tuttes_fragment, tuttes_fragment_reassignment_two_dists)
            @test partition.num_dists == 2
            @test partition.num_cut_edges == 5
            @test partition.assignments == tuttes_fragment_reassignment_assignment
        end
    end
    
    @testset "Young-Fibonacci weight leaves" begin
        young_fibonacci = load_graph_from_edge_list("data/young_fibonacci.dat", "data/young_fibonacci_weight_leaves")
        @testset "two districts" begin
            partition = load_partition_from_line(young_fibonacci, young_fibonacci_two_dists)
            @test partition.num_dists == 2
            @test partition.num_cut_edges == 3
            @test partition.assignments == young_fibonacci_two_dists_assignment
            @test partition.dist_populations == [44, 34]
        end
        @testset "three districts" begin
            partition = load_partition_from_line(young_fibonacci, young_fibonacci_three_dists)
            @test partition.num_dists == 3
            @test partition.num_cut_edges == 5
            @test partition.assignments == young_fibonacci_three_dists_assignment
            @test partition.dist_populations == [25, 28, 25]
        end
        @testset "reassign district id" begin
            partition = load_partition_from_line(young_fibonacci, young_fibonacci_reassignment_two_dists)
            @test partition.num_dists == 2
            @test partition.num_cut_edges == 4
            @test partition.assignments == young_fibonacci_reassignment_assignment
        end
    end

    @testset "Young-Fibonacci weight head" begin
        young_fibonacci = load_graph_from_edge_list("data/young_fibonacci.dat", "data/young_fibonacci_weight_head")
        @testset "two districts" begin
            partition = load_partition_from_line(young_fibonacci, young_fibonacci_two_dists)
            @test partition.num_dists == 2
            @test partition.num_cut_edges == 3
            @test partition.assignments == young_fibonacci_two_dists_assignment
            @test partition.dist_populations == [16, 26]
        end
        @testset "three districts" begin
            partition = load_partition_from_line(young_fibonacci, young_fibonacci_three_dists)
            @test partition.num_dists == 3
            @test partition.num_cut_edges == 5
            @test partition.assignments == young_fibonacci_three_dists_assignment
            @test partition.dist_populations == [25, 12, 5]
        end
        @testset "reassign district id" begin
            partition = load_partition_from_line(young_fibonacci, young_fibonacci_reassignment_two_dists)
            @test partition.num_dists == 2
            @test partition.num_cut_edges == 4
            @test partition.assignments == young_fibonacci_reassignment_assignment
        end
    end
end

# Graph Tests

@testset "Loading a graph" begin

    @testset "2x2 grid" begin
        two_by_two_grid = load_graph_from_edge_list("data/2x2_grid.dat", "data/2x2_grid_weight.dat")
        @test two_by_two_grid.num_nodes == 4
        @test two_by_two_grid.num_edges == 4
        @test two_by_two_grid.populations == [1, 2, 4, 8]
        @test two_by_two_grid.total_pop == 15
        @test two_by_two_grid.adj_matrix == [0 1 2 0; 1 0 0 3; 2 0 0 4; 0 3 4 0]
        @test two_by_two_grid.neighbors == [[2, 3], [1, 4], [1, 4], [2, 3]]
    end
    
    @testset "2x2 triangular lattice" begin 
        two_by_two_triangular_lattice = load_graph_from_edge_list("data/2x2_triangular_lattice.dat", "data/2x2_triangular_lattice_weight.dat")
        @test two_by_two_triangular_lattice.num_edges == 9
        @test two_by_two_triangular_lattice.num_nodes == 6
        @test two_by_two_triangular_lattice.populations == [1, 2, 4, 8, 10, 12]
        @test two_by_two_triangular_lattice.total_pop == 37
        @test two_by_two_triangular_lattice.neighbors == [[2, 3], [1, 3, 4], [1, 2, 4, 5, 6], [2, 3, 6], [3,6], [3, 4, 5]]
    end 
    
    @testset "6x6 grid" begin 
        six_by_six_grid = load_graph_from_edge_list("data/6x6_grid.dat", "data/6x6_grid_weight.dat")
        @test six_by_six_grid.num_edges == 60
        @test six_by_six_grid.num_nodes == 36
        @test six_by_six_grid.populations == collect(1:36)
        @test six_by_six_grid.total_pop == sum(collect(1:36))
    end 
    
    @testset "Disconnected graph" begin 
        @test_throws ArgumentError load_graph_from_edge_list("data/6x6_disconnected_grid.dat", "data/6x6_grid_weight.dat")
    end
    
    @testset "6x9 grid" begin 
        six_by_nine_grid = load_graph_from_edge_list("data/6x9_grid.dat", "data/6x9_grid_weight.dat")
        @test six_by_nine_grid.num_edges == 93
        @test six_by_nine_grid.num_nodes == 54
        @test six_by_nine_grid.populations == collect(1:54)
        @test six_by_nine_grid.total_pop == sum(collect(1:54))
    end
    
    @testset "Dumbbell middle weight" begin
        dumbbell = load_graph_from_edge_list("data/dumbbell.dat", "data/dumbbell_weight_middle.dat")
        @test dumbbell.num_edges == 28
        @test dumbbell.num_nodes == 17
        @test dumbbell.populations == [2, 1, 2, 3, 2, 2, 1, 5, 6, 5, 1, 2, 2, 3, 1, 2, 2]
        @test dumbbell.total_pop == 42
    end
    
    @testset "Dumbbell side weight" begin
        dumbbell = load_graph_from_edge_list("data/dumbbell.dat", "data/dumbbell_weight_sides.dat")
        @test dumbbell.num_edges == 28
        @test dumbbell.num_nodes == 17
        @test dumbbell.populations == [5, 6, 5, 6, 7, 5, 5, 2, 3, 2, 6, 5, 7, 5, 5, 6, 5]
        @test dumbbell.total_pop == 85
    end
    
    @testset "Petersen graph" begin 
        petersen = load_graph_from_edge_list("data/petersen.dat", "data/petersen_weight.dat")
        @test petersen.num_edges == 15
        @test petersen.num_nodes == 10
        @test petersen.populations == [3, 3, 3, 3, 3, 1, 1, 1, 1, 1]
        @test petersen.total_pop == 20
    end
    
    @testset "Tuttes fragment" begin
        tuttes_fragment = load_graph_from_edge_list("data/tuttes_fragment.dat", "data/tuttes_fragment_weight.dat")
        @test tuttes_fragment.num_edges == 24
        @test tuttes_fragment.num_nodes == 18
        @test tuttes_fragment.populations == [14, 5, 3, 5, 7, 8, 3, 5, 7, 8, 4, 7, 8, 3, 5, 6, 10, 10]
        @test tuttes_fragment.total_pop == 118
    end
    
    @testset "Young-Fibonacci weight leaves" begin
        young_fibonacci = load_graph_from_edge_list("data/young_fibonacci.dat", "data/young_fibonacci_weight_leaves.dat")
        @test young_fibonacci.num_edges == 14 
        @test young_fibonacci.num_nodes == 12
        @test young_fibonacci.populations == [1, 3, 5, 7, 9, 5, 7, 7, 9, 7, 9, 9]
        @test young_fibonacci.total_pop == 78
    end
    
    @testset "Young-Fibonacci weight head" begin
        young_fibonacci = load_graph_from_edge_list("data/young_fibonacci.dat", "data/young_fibonacci_weight_head.dat")
        @test young_fibonacci.num_edges == 14
        @test young_fibonacci.num_nodes == 12
        @test young_fibonacci.populations == [9, 7, 5, 3, 1, 5, 3, 3, 1, 3, 1, 1]
        @test young_fibonacci.total_pop == 42
    end
end
