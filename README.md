# Markov chain benchmarks

## Overview 
Say somebody has a redistricting algorithm, or in other words a method for sampling balanced partitions of a graph into a fixed number of connected subgraphs.  They think they know what distribution it is approximately sampling from.  Can we validate that?

## Tests
Use graph and weight files in test/data to test graph and partition functions.

```sh
julia test.jl --graph-file test/data/6x6_grid.dat --pop-file test/data/6x6_grid_weight.dat --enum-file test/data/6x6_grid_enum.txt
```
