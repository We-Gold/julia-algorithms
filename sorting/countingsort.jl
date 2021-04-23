function countingsort(numbers::Vector{Int64})
    _numbers = []

    min, max = extrema(numbers)

    numberCounts = zeros(Int64, length(min:max))

    # Count the number of times each number appears in the array
    for num in numbers
        numberCounts[num - min + 1] += 1
    end

    # March through the number counts, 
    # and populate the new array with the based on the counts
    for i in eachindex(numberCounts)
        for _ in 1:numberCounts[i]
            push!(_numbers, min + i - 1)
        end
    end

    return _numbers
end

@time println(countingsort(rand(-100:100, 20)))