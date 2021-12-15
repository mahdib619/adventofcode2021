mutable struct BingoMatrix
    values::Dict{String,Vector{NamedTuple{(:r, :c)}}}
    markedrows::Dict{Int,Vector{Int}}
    markedcols::Dict{Int,Vector{Int}}
    won::Bool

    function BingoMatrix(vals::Vector{String})
        (ma = new(); ma.markedrows = Dict(); ma.markedcols = Dict(); ma.values = Dict())
        for i = 1:length(vals)
            items = filter(v -> !all(isspace.(collect(v))), split(vals[i], " "))
            for j = 1:length(items)
                if haskey(ma.values, items[j])
                    push!(ma.values[items[j]], (r = i, c = j))
                else
                    ma.values[items[j]] = [(r = i, c = j)]
                end
            end
        end
        return ma
    end
end
function markvalueandcheckbingo(matrix::BingoMatrix, value::AbstractString)
    if matrix.won || !haskey(matrix.values, value)
        return
    end

    for p in matrix.values[value]
        function check(marks, mi)
            if haskey(marks, mi)
                mds = marks[mi]
                intvalue = parse(Int, value)
                push!(mds, intvalue)

                if length(mds) >= 5
                    bingo(matrix, intvalue)
                end
            else
                marks[mi] = [parse(Int, value)]
            end
        end

        check(matrix.markedrows, p.r)
        check(matrix.markedcols, p.c)
    end
end
function sumunmarked(matrix::BingoMatrix)
    markedvalues = vcat(values(matrix.markedrows)...)
    sumunmarked = 0
    for v in map(k -> parse(Int, k), collect(keys(matrix.values)))
        if !(v in markedvalues)
            sumunmarked += v
        end
    end
    sumunmarked
end
function fillmatrixes()
    global matrixes = Vector{BingoMatrix}()
    open(joinpath(Base.source_dir(), "input.txt")) do f
        global markvalues = split(readline(f), ',')
        readline(f)

        matrixchunc = Vector{String}()
        counter = 0
        filelines = readlines(f)
        for l in filelines
            if counter == 5
                push!(matrixes, BingoMatrix(matrixchunc))
                counter = 0
                matrixchunc = Vector{String}()
                continue
            end

            push!(matrixchunc, l)
            counter += 1
        end
        push!(matrixes, BingoMatrix(matrixchunc))
    end
end
function start()
    for mv in markvalues
        matrixes .|> m -> (markvalueandcheckbingo(m, mv))
    end
end

fillmatrixes()