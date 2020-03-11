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