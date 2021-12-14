include(joinpath(Base.source_dir(), "common.jl"))

halfnumlines = length(file) / 2
report = Vector{Bool}()
for i in 1:linelength
    bits = map(l -> l[i],file)
    n_one = length(bits[bits .== '1'])
    push!(report,n_one > halfnumlines)
end

gammarate = bitarrtoint(report)
epsilonrate = bitarrtoint(map(!, report))

println("diag report result: $(gammarate*epsilonrate)")