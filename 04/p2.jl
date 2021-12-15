include(joinpath(Base.source_dir(), "common.jl"))

function bingo(matrix::BingoMatrix, lastvalue::Int)
    global lastmatrix = (matrix, lastvalue)
    matrix.won = true
end

start()

println("last bingoooo! value:$(lastmatrix[2]*sumunmarked(lastmatrix[1]))")