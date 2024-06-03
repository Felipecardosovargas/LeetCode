class Solution:
    def twoSum(self, nums: list[int], target: int) -> list[int]:
        # Dictionary to store the value and its index
        seen = {}
        
        # Loop through the list of numbers
        for i, num in enumerate(nums):
            # Calculate the complement that would add up to the target
            complement = target - num
            
            # If the complement is found in the dictionary, return the indices
            if complement in seen:
                return [seen[complement], i]
            
            # Otherwise, add the current number to the dictionary
            seen[num] = i

# Example usage:
solution = Solution()
print(solution.twoSum([2, 7, 11, 15], 9))  # Output: [0, 1]
print(solution.twoSum([3, 2, 4], 6))       # Output: [1, 2]
print(solution.twoSum([3, 3], 6))          # Output: [0, 1]
