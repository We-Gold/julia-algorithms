"""
    knapsack(set, target)

Given a set of numbers and a target amount, 
returns if the sum of any subsection of the set is that target amount.

Info: This is my own personal solution to the knapsack problem. 
I do not know what "the" solution is to this problem.

Note: In a dense set (small range), it is better to use BitSet, rather than Set.
"""
function knapsack(set, target)
    # Make sure the target is possible to reach
    if sum(set) < target
        return false
    end

    remainders = Dict{Int64, Set{Int64}}()

    # Calculate the initial remainders
    for number in set
        remainder = target - number
        
        if remainder == 0
            return true
        end
        
        if remainder < 0
            continue
        end

        remainders[target - number] = Set([number])
    end

    for number in set
        for (remainder, currentset) in remainders
            newremainder = remainder - number

            if newremainder < 0 || number in currentset || haskey(remainders, newremainder)
                continue
            end

            if newremainder == 0
                return true
            end

            remainders[newremainder] = union(currentset, number)
        end
    end

    return false
end

"""
    knapsack_old(set, target)

Given a set of numbers and a target amount, 
returns if the sum of any subsection of the set is that target amount.

Info: This is one of my own personal solution to the knapsack problem. 
It is not very efficient, especially compared to my new solution, so I wouldn't recommend using it. 

Note: In a dense set (small range), it is better to use BitSet, rather than Set.
"""
function knapsack_old(set, target)
    # Make sure the target is possible to reach
    if sum(set) < target
        return false
    end

    sets = Dict{Set{Int64}, Int64}()

    # Add all numbers to initial sets
    for number in set
        if number > target
            continue
        end

        if number == target
            return true
        end
        
        sets[Set([number])] = number
    end

    # Test new subsets of the original set until a valid set is found, or none of the subsets work.
    for _ in set
        # During each stage, test out every possible new set and see if one is valid
        for (subset, currentsum) in sets
            for (othersubset, othercurrentsum) in sets
                if othersubset === subset
                    continue
                end

                newset = union(subset, othersubset)
                newsum = sum(newset)

                # Skip if this one is a duplicate or the sum is too high
                if haskey(sets, newset) || newsum > target
                    continue
                end

                if newsum == target
                    return true
                end

                sets[newset] = newsum
            end

            delete!(sets, subset)
        end
    end

    return false
end

@time knapsack(Set([1,3,5,6,8,2,12,13,15,27,56]), 76)

# OUTPUT:
# 0.000040 seconds (112 allocations: 12.727 KiB)
# true