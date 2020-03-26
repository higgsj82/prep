# valid_ip?
# Write a method that takes a string as input. It should return true if the input is a valid IPv4 address (ie. anything between 0.0.0.0 and 255.255.255.255 is valid).

# aA solution
def valid_ip?(str)
  return false unless str =~ /^\d+(\.\d+){3}$/
  nums = str.split(".").map(&:to_i)
  nums.all? {|num| num >= 0 && num <= 255}
end
# my solution
def valid_ip?(str)
    parts = str.split('.').map(&:to_i)
    return false if parts.length != 4
    parts.each do |num| 
        return false if !num.between?(0,255)
    end
    return true
end

# Implement the Folding Cipher. It folds the alphabet in half and uses the 
# adjacent letter. Ie. a <=> z, b <=> y, c <=> x, m <=> n.

# aA solution
def folding_cipher(str)
  # Hash::[] creates a hash from a list of key-value pairs
  folded_alphabet = Hash[('a'..'z').zip(('a'..'z').to_a.reverse)]
  str.chars.map { |chr| folded_alphabet[chr] }.join
end

# my solution
def folding_cipher(str)
  alphabet = 'abcdefghijklmnopqrstuvwxyz'
  new_str = ''

  str.each_char do |char|
    idx = alphabet.index(char)
    new_str += alphabet[alphabet.length - 1 - idx]
  end

  return new_str
end

# Write a function that takes a year (four digit integer) and returns an array with the 10 closest subsequent years that meet the following condition: the first two digits summed with the last two digits are equal to the middle two digits. E.g.,

# 1978 => 19 + 78 = 97
# 2307 => 23 + 07 = 30

# my solution
def silly_years(year)
  results = []
  next_year = year
  while results.length < 10
    str = next_year.to_s
    if str[0..1].to_i + str[2..3].to_i == str[1..2].to_i
      results << next_year
    end
    next_year += 1
  end
  return results
end

# puts silly_years(2307)
# puts silly_years(2308)

# productify
# Given a list of numbers in an array, replace all the numbers with the product of all other numbers. Do this in O(n) time without using division.

# Raz's solution
def productify(arr)
  new_arr = []
  i = 0 

  while i < arr.length 
    product = 1
    (0...arr.length).each do |j|
      if i != j
        product *= arr[j]
      end
    end
    new_arr << product
    i += 1
  end
  return new_arr
end

# aA solution
def productify(arr)
  products = Array.new(arr.length, 1)

  lower_prod = 1
  0.upto(arr.size - 1) do |i|
    products[i] = products[i] * lower_prod
    lower_prod = lower_prod * arr[i]
  end

  upper_prod = 1
  (arr.size - 1).downto(0) do |i|
    products[i] = products[i] * upper_prod
    upper_prod = upper_prod * arr[i]
  end

  products
end

# longest_palindrome
# Write a function that will take a string and return the indices of the start/end of the longest palindrome it contains.

# Example:
# longest_palindrome('acapella') => [0, 2]

# my solution
def isPalindrome?(str)
  last = str.length - 1

  (0..(last/2)).each do |i|
    return false if str[i] != str[last - i]
  end
  return true
end


def substrings(str)
  arr = []
  (0...str.length).each do |i|
    (i...str.length).each do |j|
      arr << str[i..j]
    end
  end
  arr.sort_by(&:length).reverse
end

def longest_palindrome(str)
  subs = substrings(str) # ordered array from largest to smallest
  subs.map{|sub| return sub if isPalindrome?(sub) && sub.length != 1}
  return false
end

# aA solution

def longest_palindrome(string)
  best_palindrome_start = 0
  best_palindrome_len = 0

  0.upto(string.length - 1).each do |start|
    # micro-optimization: don't look at substrings shorter than best
    # palindrome.
    len = best_palindrome_len + 1
    while start + len <= string.length
      if is_palindrome?(string, start, len)
        best_palindrome_start, best_palindrome_len = start, len
      end

      len += 1
    end
  end

  [best_palindrome_start, best_palindrome_start + best_palindrome_len - 1]
end

def is_palindrome?(string, start, len)
  len.times do |i|
    if string[start + i] != string[(start + len - 1) - i]
      return false
    end
  end

  true
end

# subsets
# Write a function that takes an array and returns all of its subsets. 
# How many sets will it return?

# aA solution
def subsets(arr)
  return [[]] if arr.empty?

  val = arr[0]
  subs = subsets(arr.drop(1))
  new_subs = subs.map { |sub| sub + [val] }

  subs + new_subs
end


# fast_intersection
# Given arr1 and arr2, find the intersection of both sets. It should 
# be trivial to write an O(n**2) solution. Use sorting to solve in 
# O(nlog(n)). Next, improve this to O(n) time (maybe use a non-array 
# datastructure).

# aA solution
# O(n**2) solution
def intersection1(arr1, arr2)
  arr1.uniq.select { |el| arr2.include?(el) }
end

# O(nlogn) solution
def intersection2(arr1, arr2)
  arr1, arr2, idx1, idx2 = arr1.sort, arr2.sort, 0, 0

  intersection = []
  while idx1 < arr1.length && idx2 < arr2.length
    case arr1[idx1] <=> arr2[idx2]
    when -1
      idx1 += 1
    when 0
      intersection << arr1[idx1]
      idx1 += 1
      idx2 += 1
    when 1
      idx2 += 1
    end
  end
  intersection
end

# O(n) solution
def intersection3(arr1, arr2)
  intersection = []
  set_1 = arr1.to_set
  arr2.each do |el|
    intersection << el if set_1.include?(el)
  end

  intersection
end

# can_win?
# Given an array and index, find if it's possible to reach the 
# value 0 by starting at the given index and repeatedly moving 
# left/right by the distance found at array[index].

# Example:

# can_win?([1, 0, 1], 0)
# => true

# can_win?([1, 2, 0], 0)
# => false

# aA recursive solution

def can_win?(arr, pos = 0, seen = {})
  return false if !pos.between?(0, arr.length - 1) || seen[pos]
  return true if arr[pos].zero?

  seen[pos] = true

  can_win?(arr, pos + arr[pos], seen) ||
  can_win?(arr, pos - arr[pos], seen)
end

# aA iterative solution
def can_win(array, index)
  positions_to_try = [index]
  visited_positions = Array.new(array.length, false)
  visited_positions[index] = true

  until positions_to_try.empty?
    # We should probably use a queue for this.
    position = positions_to_try.shift
    value = array[position]

    if value == 0
      return true
    end

    [position + value, position - value].each do |pos|
      next if visited_positions[pos]
      next if (pos < 0 || array.length <= pos)

      positions_to_try << pos
      # This insures we don't add a position twice to our queue.
      visited_positions[pos] = true
    end
  end

  false
end


# weighted_random_index
# Given an array, write a function that will return a random index 
# of the array. The probability of an index being returned is weighted 
# by the value at that index against the sum of the array values. For 
# example, for the array [4, 6, 8], index 0 should be returned with 
# 4 in 18 odds, index 1 should be returned with 6 in 18 odds, and 
# index 2 should be return with 8 in 18 odds. Implement this in O(n) time.

# aA solution
def weighted_random_index(arr)
  total_sum = arr.inject(:+)
  value = rand(total_sum)

  cumulative_sum = 0
  arr.each_with_index do |el, i|
    cumulative_sum += el
    return i if value < cumulative_sum
  end
end

# move_zeros
# Given an array, move all zeros to the end. The order of non-zero 
# elements does not matter. Ex:

# move_zeros([1, 2, 0, 3, 4, 0, 5, 6, 0]) == [1, 2, 6, 3, 4, 5, 0, 0, 0]
# Algorithm should be O(n); use O(1) extra space.

# aA solution
def move_zeros(array)
  current_index = 0
  num_zeros = 0

  while current_index < (array.length - num_zeros)
    current_value = array[current_index]

    if current_value != 0
      current_index += 1
      next
    end

    back = array.length - 1 - num_zeros
    array[current_index], array[back] =
      array[back], array[current_index]
    num_zeros += 1

    # we can't add one to current_index since `back` may have
    # contained a zero and we don't know it.
  end

  # Return the array
  array
end

def move_zeros2(arr)
  left, right = 0, arr.size - 1
  loop do
    left  += 1 until arr[left]  == 0 || left == right
    right -= 1 until arr[right] != 0 || left == right
    break if left == right
    arr[left], arr[right] = arr[right], arr[left]
  end
  arr
end

look_and_say
Implement the 'look and say' function. 'Look and say' takes an input array and outputs an array that describes the count of the elements in the input array as they appear in order.

Example:

# there is one '1' in the input array
look_and_say([1]) == [[1, 1]]

# there are two '1's in the input array
look_and_say([1, 1]) == [[2, 1]]

# there is one '2', followed by one '1' in the input array
look_and_say([2, 1]) == [[1, 2], [1, 1]]

# is one '1', followed by one '2', followed by 2 '1's in the input
# array
look_and_say([1, 2, 1, 1]) == [[1, 1], [1, 2], [2, 1]]
Solution
Maintain a current count, maintain a current element. Push both onto new array when a different element is detected.

def look_and_say(array)
  return [] if array.empty?

  output = [[1, array[0]]]

  (1...array.length).each do |idx|
    el = array[idx]
    if el == output.last[1]
      output.last[0] += 1
    else
      output << [1, el]
    end
  end

  output
end
