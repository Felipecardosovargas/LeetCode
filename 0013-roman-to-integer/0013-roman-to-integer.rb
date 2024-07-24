# @param {String} s
# @return {Integer}
def roman_to_int(s)
  roman_values = {
    'I' => 1,
    'V' => 5,
    'X' => 10,
    'L' => 50,
    'C' => 100,
    'D' => 500,
    'M' => 1000
  }

  total = 0
  i = 0

  while i < s.length
    if i + 1 < s.length && roman_values[s[i]] < roman_values[s[i + 1]]
      total -= roman_values[s[i]]
    else
      total += roman_values[s[i]]
    end
    i += 1
  end

  total
end

# Test cases
puts roman_to_int("III")     # Output: 3
puts roman_to_int("LVIII")   # Output: 58
puts roman_to_int("MCMXCIV") # Output: 1994
