using GerryChain
using Test

const testdir = dirname(@__FILE__)

tests = [
    "graph",
    "partition"
]

@testset "Benchmark" begin
    for t in tests
        tp = joinpath(testdir, "$(t).jl")
        include(tp)
    end
end