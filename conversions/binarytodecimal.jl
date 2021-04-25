"""
    binarytodecimal(number::AbstractString)::Int64

Given a binary number (as a string), returns its value as a base 10 integer.
"""
function binarytodecimal(number::AbstractString)::Int64
    isnegative = number[1] == '-'

    binarystring = if isnegative
        binarystring = number[2:end]
    else
        binarystring = number
    end

    sum = 0

    for c in binarystring
        sum = 2 * sum + parse(Int64, c)
    end

    return isnegative ? -sum : sum
end

@time binarytodecimal("10101010")