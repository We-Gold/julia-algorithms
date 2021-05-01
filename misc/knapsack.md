English Description of the Algorithm:

First, if the sum of all of the numbers in the given set is greater than the target,
return FALSE, because it is clearly impossible to find a subset that will sum to the target.
Otherwise, create a dictionary that maps integers to sets of numbers, called `remainders`.
Add each number in the original set to its own set, and calculate the remainder when 
the current number is subtracted from the target number. If that number is zero, then
the target has been reached, so return TRUE. If the number is less than zero, the number is
too large, so don't do anything with this set and remainder. Otherwise, use the remainder as
a key in the dictionary, and use the set containing the single number as its value. Next,
loop through all of the numbers in the original set. For each number in the original set,
loop through all of the remainders and corresponding sets in the dictionary. Calculate the
new remainder if this number where to be added to the current set. If the current number is 
in the current set, skip this set in the dictionary, because you can't have duplicates in a set.
If the new remainder is less than zero, then skip this set in the dictionary, because that means
that the sum of the set is greater than the target. Also, if the dictionary already has a 
key of the new remainder, skip this set, because we already have a set that produces this same remainder,
and we don't care if there is more than one solution to this problem. Check if the new remainder is zero.
If so, return TRUE, because we have found a subset that has a sum equal to the target value.
Otherwise, combine the current number and the current set, and add the new set as the value for the
new remainder in the dictionary. If, after we have gone through all of the numbers in the original set,
we still have not found a subset with a sum of the target, return FALSE, because there is no subset
of the given set that has a sum of the target value.

