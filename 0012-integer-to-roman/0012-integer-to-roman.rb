# @param {Integer} num
# @return {String}
def int_to_roman(num)
  # Lista de pares (valor, símbolo) em ordem decrescente
  val = [
    1000, 900, 500, 400,
    100, 90, 50, 40,
    10, 9, 5, 4,
    1
  ]
  syms = [
    "M", "CM", "D", "CD",
    "C", "XC", "L", "XL",
    "X", "IX", "V", "IV",
    "I"
  ]
  
  roman_num = ''
  i = 0
  
  while num > 0
    while num >= val[i]
      roman_num += syms[i]
      num -= val[i]
    end
    i += 1
  end
  
  roman_num
end

# Testes
puts int_to_roman(3749)  # Saída: "MMMDCCXLIX"
puts int_to_roman(58)    # Saída: "LVIII"
puts int_to_roman(1994)  # Saída: "MCMXCIV"
