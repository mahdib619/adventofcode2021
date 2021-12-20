sum1478 = 0
const ndigits = [2, 4, 3, 7]

open(joinpath(Base.source_dir(), "input.txt")) do file
    for l in eachline(file)
        o4 = split(split(l, " | ")[2], " ")
        global sum1478 += length(o4[o4.|>o->length(o) in ndigits])
    end
end

println(sum1478)