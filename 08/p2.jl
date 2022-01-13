digitsLengths = Dict{Int,Vector{String}}()
mainMapper = Dict{String,Int}()
getdigit(segments) = mainMapper[join(sort(collect(segments)))]

function fillLengths!(patterns)
    empty!(digitsLengths)
    for p in patterns
        len = length(p)
        arr = get(digitsLengths, len, [])
        push!(arr, p)
        digitsLengths[len] = arr
    end
end
function fillMainMapper!(pattern)
    fillLengths!(pattern)

    one1 = digitsLengths[2][1]
    four = digitsLengths[4][1]
    seven = digitsLengths[3][1]
    eight = digitsLengths[7][1]

    # get 0 6 9
    n069 = digitsLengths[6]
    bd = filter(c -> !contains(one1, c), four)

    zeroI = findfirst(s -> !issubset(bd, s), n069)
    zero0 = n069[zeroI]
    deleteat!(n069, zeroI)

    nineI = findfirst(s -> issubset(one1, s), n069)
    nine = n069[nineI]
    deleteat!(n069, nineI)

    six = n069[1]

    # get 5 2 3
    n235 = digitsLengths[5]
    fI = findfirst(ch -> contains(six, ch), one1)
    f = one1[fI]

    threeI = findfirst(s -> issubset(one1, s), n235)
    three = n235[threeI]
    deleteat!(n235, threeI)

    five = filter(s -> contains(s, f), n235)[1]
    two = filter(s -> !contains(s, f), n235)[1]

    sDigits = [zero0, one1, two, three, four, five, six, seven, eight, nine]
    empty!(mainMapper)
    for i in 0:9
        mainMapper[join(sort(collect(sDigits[i+1])))] = i
    end
end
function getNumber(pattern, segments)
    fillMainMapper!(pattern)
    return parse(Int, string(getdigit.(segments)...))
end

sumN = 0
open(joinpath(Base.source_dir(), "input.txt")) do file
    for line in eachline(file)
        sigpat = split(line, " | ")
        patterns = split(sigpat[1])
        segments = split(sigpat[2])
    
        global sumN += getNumber(patterns, segments)
    end
end
println("Result $sumN")