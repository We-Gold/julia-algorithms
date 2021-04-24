"""
    selectionsort!(numbers)

Takes an array of integers and sorts it using the selection sort algorithm.
"""
function selectionsort!(numbers::Vector{Int64})::Vector{Int64}
    # March through the array, finding the smallest number in the rest of array,
    # and replacing the current element with that one, until the array is sorted
    for i in eachindex(numbers)
        min = (i - 1) + argmin(numbers[i:end])
        numbers[i], numbers[min] = numbers[min], numbers[i]
    end

    return numbers
end

@time selectionsort!(rand(-100:100, 20))