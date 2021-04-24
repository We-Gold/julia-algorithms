"""
    bubblesort(numbers)

Takes an array of integers and sorts it using the bubble sort algorithm.
"""
function bubblesort!(numbers::Vector{Int64})::Vector{Int64}
    n = length(numbers)

    # Loop through the array, swapping adjacent elements 
    # that are out of order, until the array is sorted
    for i in 1:n
        for j in 2:(n - i + 1)
            if numbers[j - 1] > numbers[j]
                numbers[j - 1], numbers[j] = numbers[j], numbers[j - 1]
            end
        end
    end

    return numbers
end

@time bubblesort!(rand(-100:100, 100))