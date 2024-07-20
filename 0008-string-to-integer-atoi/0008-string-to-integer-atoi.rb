# @param {String} s
# @return {Integer}
def my_atoi(s)
  # Remove leading whitespaces
  s.strip!
  
  # Return 0 if the string is empty after stripping
  return 0 if s.empty?
  
  # Determine the sign
  sign = 1
  if s[0] == '-'
    sign = -1
    s = s[1..-1]
  elsif s[0] == '+'
    s = s[1..-1]
  end
  
  # Read in the number
  num = 0
  i = 0
  while i < s.length && s[i] >= '0' && s[i] <= '9'
    num = num * 10 + (s[i].ord - '0'.ord)
    i += 1
  end
  
  # Apply the sign
  num *= sign
  
  # Handle 32-bit overflow
  int_max = 2**31 - 1
  int_min = -2**31
  if num < int_min
    return int_min
  elsif num > int_max
    return int_max
  else
    return num
  end
end
