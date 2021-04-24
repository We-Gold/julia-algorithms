"""
    mergesort!(numbers)

Takes an array of integers and sorts it using the merge sort algorithm.
"""
function mergesort!(numbers::Vector{Int64})::Vector{Int64}
    mergesorthelper!(numbers, 1, lastindex(numbers))

    return numbers
end

function mergesorthelper!(numbers::Vector{Int64}, start1::Int64, end1::Int64)
    if start1 >= end1
        return
    end

    middle = convert(Int64, floor((start1 + end1) / 2))

    # Recursively run mergesort on the halves of the array
    mergesorthelper!(numbers, start1, middle)
    mergesorthelper!(numbers, middle + 1, end1)
    
    # Merge the sorted halves of the array together
    merge!(numbers, start1, middle, middle + 1, end1)
end

function merge!(numbers::Vector{Int64}, start1::Int64, end1::Int64, start2::Int64, end2::Int64)
    range = [start1:end1; start2:end2]

    _numbers = []

    # March through the subarrays and copy over elements in order until one subarray is empty
    while start1 <= end1 && start2 <= end2
        if numbers[start1] < numbers[start2]
            push!(_numbers, numbers[start1])
            start1 += 1
        else 
            push!(_numbers, numbers[start2])
            start2 += 1
        end
    end

    # Copy over any remaining elements from the first subarray
    for i in start1:end1
        push!(_numbers, numbers[i])
    end

    # Copy over any remaining elements from the second subarray
    for i in start2:end2
        push!(_numbers, numbers[i])
    end

    # Copy over all of the numbers from our temporary array to the original array
    for i in eachindex(_numbers)
        numbers[range[i]] = _numbers[i]
    end
end

@time mergesort!(rand(-100:100, 20))