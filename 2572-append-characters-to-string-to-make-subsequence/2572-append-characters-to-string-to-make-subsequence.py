class Solution:
    def appendCharacters(self, s: str, t: str) -> int:
        # Initialize two pointers for s and t
        i, j = 0, 0
        
        # Traverse both strings to find the longest prefix of t that is a subsequence of s
        while i < len(s) and j < len(t):
            if s[i] == t[j]:
                j += 1
            i += 1
        
        # The number of characters to be appended is the remaining characters in t
        return len(t) - j

# Example usage:
solution = Solution()
print(solution.appendCharacters("coaching", "coding"))  # Output: 4
print(solution.appendCharacters("abcde", "a"))          # Output: 0
print(solution.appendCharacters("z", "abcde"))          # Output: 5
