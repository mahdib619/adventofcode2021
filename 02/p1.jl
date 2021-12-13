forwards = Vector{Int8}()
ups = Vector{Int8}()
downs = Vector{Int8}()
arrs = Dict('f' => forwards, 'u' => ups, 'd' => downs)

open("input.txt") do f
    for l in eachline(f)
        num = parse(Int8,l[findfirst(' ', l)+1:end])
        push!(arrs[l[1]], num)
    end
end

println("mul Dims: $((sum(downs)-sum(ups))*sum(forwards))")