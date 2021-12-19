nums = parse.(Int, split(readline(joinpath(Base.source_dir(), "input.txt")), ","))
nums2 = unique(nums)

function findminfuel()
    min = minimum(nums2) do n
        getfuel(n), n
    end

    adder = 0
    if (minv = getfuel(min[2] - 1); minv) < min[1]
        adder = -1
    elseif (minv = getfuel(min[2] + 1); minv) < min[1]
        adder = 1
    else
        println("minimum needed fuel: $(min[1])")
        exit()
    end

    i = adder * 2
    while true
        minl = getfuel(min[2] + i)
        if minl < minv
            minv = minl
            i += adder
        else
            println("minimum needed fuel: $minv")
            break
        end
    end
end