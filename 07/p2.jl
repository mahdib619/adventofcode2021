include(joinpath(Base.source_dir(), "common.jl"))

getfuel(dest) = sum([(diff = abs(n - dest); sum(1:diff)) for n in nums])
findminfuel()