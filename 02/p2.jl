aim, x, y = 0, 0, 0
function forward(ax)
    global x += ax
    global y += ax * aim
end
function down(aAim)
    global aim += aAim
end
function up(aAim)
    global aim -= aAim
end

funcs = Dict('f' => forward, 'd' => down, 'u' => up)
open(joinpath(Base.source_dir(),"input.txt")) do f
    for l in eachline(f)
        num = parse(Int8,l[findfirst(' ', l)+1:end])
        funcs[first(l)](num)
    end
end

println("mul Dims: $(x * y)")