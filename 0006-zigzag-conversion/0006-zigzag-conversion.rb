# @param {String} s
# @param {Integer} num_rows
# @return {String}
def convert(s, num_rows)
  # Se o número de linhas for 1 ou o comprimento da string for menor ou igual ao número de linhas
  # Retorne a string original, pois não haverá alteração
  return s if num_rows == 1 || s.length <= num_rows

  # Crie um array de strings para armazenar os caracteres de cada linha
  rows = Array.new([num_rows, s.length].min) { "" }
  
  # Variável para rastrear a linha atual
  cur_row = 0
  
  # Flag para alternar entre mover para baixo e para cima nas linhas
  going_down = false

  # Iterar sobre cada caractere da string
  s.each_char do |char|
    # Adicionar o caractere à linha atual
    rows[cur_row] += char
    
    # Alterar a direção quando atingir o topo ou a base do Zigzag
    if cur_row == 0 || cur_row == num_rows - 1
      going_down = !going_down
    end
    
    # Mover para a próxima linha
    cur_row += going_down ? 1 : -1
  end

  # Concatenar todas as linhas para formar a string resultante
  rows.join
end
