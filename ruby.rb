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