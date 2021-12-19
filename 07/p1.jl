include(joinpath(Base.source_dir(), "common.jl"))

getfuel(num) = sum(abs.(nums .- num))
findminfuel()