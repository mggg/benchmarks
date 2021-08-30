module Benchmark
using GerryChain
using LightGraphs
using PyPlot
using LinearAlgebra
using StatsBase
using ArgParse

export main

include("test.jl")
include("main.jl")

end # module
