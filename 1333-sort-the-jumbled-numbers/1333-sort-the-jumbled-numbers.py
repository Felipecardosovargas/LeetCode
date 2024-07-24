from typing import List

class Solution:
    def sortJumbled(self, mapping: List[int], nums: List[int]) -> List[int]:
        def map_number(num):
            # Convert the number to its mapped value
            mapped_str = ''.join(str(mapping[int(digit)]) for digit in str(num))
            return int(mapped_str)  # Convert mapped value back to integer
        
        # Sort nums based on the mapped values while maintaining relative order for equal mapped values
        sorted_nums = sorted(nums, key=lambda x: map_number(x))
    
        return sorted_nums

# Example Usage
solution = Solution()

mapping1 = [8, 9, 4, 0, 2, 1, 3, 5, 7, 6]
nums1 = [991, 338, 38]
print(solution.sortJumbled(mapping1, nums1))  # Output: [338, 38, 991]

mapping2 = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
nums2 = [789, 456, 123]
print(solution.sortJumbled(mapping2, nums2))  # Output: [123, 456, 789]

