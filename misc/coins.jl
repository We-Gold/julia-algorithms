"""
    minimumcoins(coins, amount)

Given a coinage system `coins`, and a desired amount of money `amount`,
compute the minimum number of coins needed to produce that amount of money.
"""
function minimumcoins(coins::Vector{Int64}, amount::Int64)
    min = Inf

    # Find the number of coins used for each valid coin, and take the minimum.
    for i in length(coins):-1:1
        # Skip any coins with a greater value than the desired amount
        coins[i] > amount && continue

        # Compute the number of times this coin goes into the desired amount
        count = amount ÷ coins[i]

        # Calculate the amount (of money) still needed
        remainder = amount - (coins[i] * count)

        # Recursively calculate the minimum number of coins still needed
        if(count < min && remainder > 0) 
            count += minimumCoins(coins[1:(i - 1)], remainder)
        end

        if(count < min) 
            min = count
        end
    end

    return min
end

@time minimumcoins([1,6,27,82], 5)