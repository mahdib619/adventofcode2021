include(joinpath(Base.source_dir(), "common.jl"))

function digonal(x1, y1, x2, y2)
    stepy = y1 > y2 ? -1 : 1
    stepx = x1 > x2 ? -1 : 1

    for xy in zip(x1:stepx:x2, y1:stepy:y2)
        foundventat(xy)
    end

    return true
end

overlapcheckers = [horizontal, vertical, digonal]
start()