using DataStructures

mutable struct FishGroup # this is group of fishes that give birth in the same day
    toborn::Int
    count::Int
end
FishGroup(toborn::Int) = FishGroup(toborn, 1)
# if two groups have same birth date, they join together
Base.isequal(a::FishGroup, b::FishGroup) = (equal = b.toborn == a.toborn; equal ? (b.count += a.count; true) : false)
Base.isless(a::FishGroup, b::FishGroup) = isless(a.toborn, b.toborn)

fishes = SortedSet(map(FishGroup, parse.(Int, split(readline(joinpath(Base.source_dir(), "input.txt")), ","))))
function start(ndays)
    while ndays > 0
        firstItem = pop!(fishes)
        dayspassed = firstItem.toborn + 1
        ndays -= dayspassed
        fishes .|> fg -> fg.toborn -= dayspassed

        insert!(fishes, FishGroup(8, firstItem.count))
        firstItem.toborn = 6
        insert!(fishes, firstItem)
    end
    println("number of fishes: $(sum(map(f->f.count,collect(fishes))))")
end