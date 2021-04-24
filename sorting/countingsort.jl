"""
    countingsort(numbers)

Takes an array of integers and sorts it using the counting sort algorithm.
Note: does not modify the original array.
"""
function countingsort(numbers::Vector{Int64})::Vector{Int64}
    _numbers = []

    min, max = extrema(numbers)

    numbercounts = zeros(Int64, length(min:max))

    # Count the number of times each number appears in the array
    for num in numbers
        numbercounts[num - min + 1] += 1
    end

    # March through the number counts, 
    # and populate the new array with the based on the counts
    for i in eachindex(numbercounts)
        for _ in 1:numbercounts[i]
            push!(_numbers, min + i - 1)
        end
    end

    return _numbers
end

@time countingsort(rand(-100:100, 20))