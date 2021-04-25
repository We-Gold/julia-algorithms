"""
    fib(n)

Returns the nth number in the fibonacci sequence. 
Note: uses BigInt but there will still be overflow with large numbers (will return negative numbers).
"""
function fib(n::BigInt, memo=Dict{BigInt, BigInt}())::BigInt
    return get!(memo, n) do 
        if n < 2
            return n
        end

        return fib(n - 1, memo) + fib(n - 2, memo)
    end
end

@time fib(100)