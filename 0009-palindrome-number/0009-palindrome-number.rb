# @param {Integer} x
# @return {Boolean}
def is_palindrome(x)
  # Números negativos não podem ser palíndromos
  return false if x < 0
  
  # Converta o número para string, reverta e compare com a string original
  x.to_s == x.to_s.reverse
end
