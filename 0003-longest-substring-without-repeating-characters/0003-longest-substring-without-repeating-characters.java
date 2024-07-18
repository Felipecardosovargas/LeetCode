import java.util.HashMap;
import java.util.Map;

public class Solution {
    public int lengthOfLongestSubstring(String s) {
        // Map para armazenar o índice mais recente de cada caractere
        Map<Character, Integer> charMap = new HashMap<>();
        int maxLength = 0;
        int start = 0;

        for (int end = 0; end < s.length(); end++) {
            char currentChar = s.charAt(end);

            if (charMap.containsKey(currentChar)) {
                // Se o caractere já está no mapa, move o ponteiro de início
                // para a direita da última ocorrência de currentChar + 1
                start = Math.max(charMap.get(currentChar) + 1, start);
            }

            // Atualiza o índice mais recente do caractere
            charMap.put(currentChar, end);

            // Atualiza o comprimento máximo encontrado até agora
            maxLength = Math.max(maxLength, end - start + 1);
        }

        return maxLength;
    }

    public static void main(String[] args) {
        Solution solution = new Solution();

        String s1 = "abcabcbb";
        System.out.println("Input: s = \"" + s1 + "\"");
        System.out.println("Output: " + solution.lengthOfLongestSubstring(s1));  // Output: 3

        String s2 = "bbbbb";
        System.out.println("Input: s = \"" + s2 + "\"");
        System.out.println("Output: " + solution.lengthOfLongestSubstring(s2));  // Output: 1

        String s3 = "pwwkew";
        System.out.println("Input: s = \"" + s3 + "\"");
        System.out.println("Output: " + solution.lengthOfLongestSubstring(s3));  // Output: 3
    }
}
