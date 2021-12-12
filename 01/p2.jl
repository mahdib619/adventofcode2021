nums = map(x -> parse(Int32, x), readlines("input.txt"))
counter = 0
pre = typemax(Int32)
for i = 1:length(nums) - 2
    sumA = sum(nums[i:i+2])
    if (sumA > pre)
        global counter += 1
    end
    global pre = sumA
end

print("$counter measurements are larger than the previous measurement")