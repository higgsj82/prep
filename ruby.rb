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