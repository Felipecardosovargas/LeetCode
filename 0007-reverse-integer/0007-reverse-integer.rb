# @param {Integer} x
# @return {Integer}
def reverse(x)
  # Verifica se o número é negativo
  negative = x < 0
  
  # Converte o número para string, remove o sinal negativo se houver, e reverte os caracteres
  reversed_str = x.abs.to_s.reverse
  
  # Converte a string revertida de volta para inteiro
  reversed_int = reversed_str.to_i
  
  # Reaplica o sinal negativo se necessário
  reversed_int = -reversed_int if negative
  
  # Verifica se o resultado está dentro dos limites de um inteiro de 32 bits
  if reversed_int < -2**31 || reversed_int > 2**31 - 1
    return 0
  else
    return reversed_int
  end
end
