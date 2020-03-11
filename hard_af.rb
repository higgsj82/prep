# largest_contiguous_subsum
# Given an array of integers (positive and negative) find the largest contiguous subsum (sum of a subarray).

# You can solve this trivially in O(n**2) time by considering all subarrays. Try to solve it in O(n) time with O(1) memory.

# Recursive Solution
# Say for an array of n elements you know:

# The largest contiguous subsum, AND
# The largest contiguous subsum ending at the last of n elements.
# Now, say that you extend the n elements with an n+1th element. How does the largest contiguous subsum ending at the n+1th element change?

# How does the largest contiguous subsum change?

# Illustration:

# Suppose your array is [5, 3, -7, 6], then:

# * The largest subsum is 8 with subarray [5, 3].
# * The largest subsum ending at the last element is 7 with subarray [5, 3, -7, 6].

# Say that you push 4 to the array to get [5, 3, -7, 6, 4].

# * The largest subsum ending at the last element is 11 with subarray [5, 3, -7, 6, 4].
# * The largest subsum overall is the max of the old largest subsum AND the new largest subsum.
# In other words, the new largest sum is 11 because [8, 11].max = 11.
def lcs(arr)
  lcs_helper(arr)[:best_sum]
end

def lcs_helper(arr)
  if arr.empty?
    return { best_sum: 0, best_suffix_sum: 0 }
  end

  # Note: using `arr.drop` would use O(n) extra space. But if you pass a `start_idx`
  # to `lcs_helper` and not create new arrays, you can achieve O(1) extra space.

  result = lcs_helper(arr.drop(1))
  old_best_sum, old_best_suffix_sum = result[:best_sum], result[:best_suffix_sum]
  new_best_suffix_sum = [old_best_suffix_sum + arr.first, arr.first].max
  new_best_sum = [old_best_sum, new_best_suffix_sum].max

  { best_sum: new_best_sum,
    best_suffix_sum: new_best_suffix_sum }
end