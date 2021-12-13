counter = 0
open(joinpath(Base.source_dir(),"input.txt")) do f
    pre = parse(Int, readline(f))
    for l in eachline(f)
        l = parse(Int, l)
        if l > pre
            global counter += 1
        end
        pre = l
    end
end
print("$counter measurements are larger than the previous measurement")