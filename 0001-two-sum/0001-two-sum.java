import java.util.HashMap;
import java.util.Map;

public class Solution {
    public int[] twoSum(int[] nums, int target) {
        // HashMap to store the value and its index
        Map<Integer, Integer> seen = new HashMap<>();
        
        // Loop through the array of numbers
        for (int i = 0; i < nums.length; i++) {
            // Calculate the complement that would add up to the target
            int complement = target - nums[i];
            
            // If the complement is found in the HashMap, return the indices
            if (seen.containsKey(complement)) {
                return new int[] { seen.get(complement), i };
            }
            
            // Otherwise, add the current number to the HashMap
            seen.put(nums[i], i);
        }
        
        // Return an empty array if no solution is found (though the problem guarantees one solution)
        return new int[] {};
    }

    public static void main(String[] args) {
        Solution solution = new Solution();
        int[] nums1 = {2, 7, 11, 15};
        int target1 = 9;
        int[] result1 = solution.twoSum(nums1, target1);
        System.out.println("Indices: " + result1[0] + ", " + result1[1]);  // Output: Indices: 0, 1

        int[] nums2 = {3, 2, 4};
        int target2 = 6;
        int[] result2 = solution.twoSum(nums2, target2);
        System.out.println("Indices: " + result2[0] + ", " + result2[1]);  // Output: Indices: 1, 2

        int[] nums3 = {3, 3};
        int target3 = 6;
        int[] result3 = solution.twoSum(nums3, target3);
        System.out.println("Indices: " + result3[0] + ", " + result3[1]);  // Output: Indices: 0, 1
    }
}
