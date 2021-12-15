include(joinpath(Base.source_dir(), "common.jl"))

function bingo(matrix::BingoMatrix, lastvalue::Int)
    println("bingooo! value:$(lastvalue*sumunmarked(matrix))")
    exit()
end

start()