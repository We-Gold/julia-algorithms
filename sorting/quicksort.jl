"""
    quicksort!(numbers)

Takes an array of integers and sorts it using the quick sort algorithm.
"""
function quicksort!(numbers::Vector{Int64})::Vector{Int64}
    quicksorthelper!(numbers, 1, lastindex(numbers))

    return numbers
end

function quicksorthelper!(numbers::Vector{Int64}, low::Int64, high::Int64)
    if low >= high
        return 
    end

    pivotindex = partition!(numbers, low, high)

    # Recursively sort the left and right parts of the array
    quicksorthelper!(numbers, low, pivotindex - 1)
    quicksorthelper!(numbers, pivotindex + 1, high)
end

function partition!(numbers::Vector{Int64}, low::Int64, high::Int64)::Int64
    # Use the rightmost number as the pivot
    pivot = numbers[high]

    # Create a variable to track where the pivot should eventually be placed
    i = low - 1

    # Swap elements in the array until the numbers are separated
    # by whether they are greater or smaller than the pivot
    for j in low:(high - 1)
        if numbers[j] < pivot
            i += 1
            numbers[j], numbers[i] = numbers[i], numbers[j]
        end
    end

    # Put the pivot in its correct location
    numbers[i + 1], numbers[high] = numbers[high], numbers[i + 1]

    return i + 1
end

@time quicksort!(rand(-100:100, 100))