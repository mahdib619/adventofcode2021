coordinates = Dict()
function horizontal(x1, y1, x2, y2)
    if y1 != y2
        return false
    end

    step = x1 > x2 ? -1 : 1
    for xx = x1:step:x2
        foundventat((xx, y1))
    end

    return true
end
function vertical(x1, y1, x2, y2)
    if x1 != x2
        return false
    end

    step = y1 > y2 ? -1 : 1
    for yy = y1:step:y2
        foundventat((x1, yy))
    end

    return true
end

function foundventat(c)
    if !haskey(coordinates, c)
        coordinates[c] = 1
    else
        coordinates[c] += 1
    end
end
function start()
    open(joinpath(Base.source_dir(), "input.txt")) do f
        for l in eachline(f)
            coordinatesarr = parse.(Int,vcat(split.(split(l, " -> "), ",")...))
            for func in overlapcheckers
                if func(coordinatesarr...)
                    break
                end
            end
        end
    end

    print("found $(length(filter(f->f[2]>=2,coordinates))) overlaps")
end