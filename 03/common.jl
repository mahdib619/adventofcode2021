function bitarrtoint(arr::Vector{Bool})
    num = 0
    i = length(arr)
    for b in arr
        if b
            num += 2^(i - 1)
        end
        i -= 1
    end
    num
end
function bitstoint(str::String)
    bitarrtoint(map(c -> c == '1', collect(str)))
end
file = readlines(joinpath(Base.source_dir(), "input.txt"))
linelength = length(file[1])