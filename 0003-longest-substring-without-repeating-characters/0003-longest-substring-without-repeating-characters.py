class Solution:
    def lengthOfLongestSubstring(self, s: str) -> int:
        # Dictionary to store the most recent index of each character
        char_map = {}
        max_length = 0
        start = 0

        for end in range(len(s)):
            if s[end] in char_map:
                # If the character is already in the dictionary, move the start pointer
                # to the right of the last occurrence of s[end] + 1
                start = max(char_map[s[end]] + 1, start)

            # Update the last seen position of the character
            char_map[s[end]] = end

            # Update the maximum length found so far
            max_length = max(max_length, end - start + 1)

        return max_length

# Example usage:
solution = Solution()

s1 = "abcabcbb"
print(f"Input: s = \"{s1}\"")
print("Output:", solution.lengthOfLongestSubstring(s1))  # Output: 3

s2 = "bbbbb"
print(f"Input: s = \"{s2}\"")
print("Output:", solution.lengthOfLongestSubstring(s2))  # Output: 1

s3 = "pwwkew"
print(f"Input: s = \"{s3}\"")
print("Output:", solution.lengthOfLongestSubstring(s3))  # Output: 3
