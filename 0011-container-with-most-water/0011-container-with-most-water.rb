# @param {Integer[]} height
# @return {Integer}
def max_area(height)
  left = 0
  right = height.length - 1
  max_area = 0
  
  while left < right
    # Calcula a área
    width = right - left
    min_height = [height[left], height[right]].min
    area = width * min_height
    max_area = [max_area, area].max
    
    # Move o ponteiro da linha menor
    if height[left] < height[right]
      left += 1
    else
      right -= 1
    end
  end
  
  max_area
end
