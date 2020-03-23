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


