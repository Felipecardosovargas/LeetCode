# @param {Integer[]} nums
# @return {Integer[][]}

def three_sum(nums)
  # Ordena a lista de números
  nums.sort!
  result = []

  # Itera sobre a lista
  (0...nums.size - 2).each do |i|
    # Pula números repetidos para evitar duplicados no resultado
    next if i > 0 && nums[i] == nums[i - 1]

    # Define os ponteiros
    left, right = i + 1, nums.size - 1

    while left < right
      sum = nums[i] + nums[left] + nums[right]

      if sum == 0
        result << [nums[i], nums[left], nums[right]]

        # Move o ponteiro esquerdo para a direita, pulando duplicados
        left += 1
        while left < right && nums[left] == nums[left - 1]
          left += 1
        end

        # Move o ponteiro direito para a esquerda, pulando duplicados
        right -= 1
        while left < right && nums[right] == nums[right + 1]
          right -= 1
        end
      elsif sum < 0
        left += 1
      else
        right -= 1
      end
    end
  end

  result
end

# Testando com os casos fornecidos
test_cases = [
  { nums: [-1, 0, 1, 2, -1, -4], expected: [[-1, -1, 2], [-1, 0, 1]] },
  { nums: [0, 1, 1], expected: [] },
  { nums: [0, 0, 0], expected: [[0, 0, 0]] }
]

test_cases.each do |test|
  output = three_sum(test[:nums])
  puts "Input: #{test[:nums].inspect}"
  puts "Output: #{output.inspect}"
  puts "Expected: #{test[:expected].inspect}"
  puts "Pass: #{output.sort == test[:expected].sort}"
  puts
end
