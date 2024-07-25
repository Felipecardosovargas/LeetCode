#include <vector>
#include <algorithm>

class Solution {
public:
    std::vector<std::vector<int>> fourSum(std::vector<int>& nums, int target) {
        std::vector<std::vector<int>> result;
        
        // Ordena o array para facilitar a busca de combinações e evitar duplicados
        std::sort(nums.begin(), nums.end());
        
        int n = nums.size();
        
        // Primeira camada de iteração: o primeiro número do quarteto
        for (int i = 0; i < n - 3; ++i) {
            // Evita duplicados
            if (i > 0 && nums[i] == nums[i - 1]) continue;
            
            // Segunda camada de iteração: o segundo número do quarteto
            for (int j = i + 1; j < n - 2; ++j) {
                // Evita duplicados
                if (j > i + 1 && nums[j] == nums[j - 1]) continue;
                
                // Inicializa os ponteiros para os dois últimos números
                int left = j + 1;
                int right = n - 1;
                
                while (left < right) {
                    long long sum = (long long)nums[i] + nums[j] + nums[left] + nums[right];
                    
                    if (sum == target) {
                        result.push_back({nums[i], nums[j], nums[left], nums[right]});
                        
                        // Move o ponteiro esquerdo e evita duplicados
                        ++left;
                        while (left < right && nums[left] == nums[left - 1]) ++left;
                        
                        // Move o ponteiro direito e evita duplicados
                        --right;
                        while (left < right && nums[right] == nums[right + 1]) --right;
                    } else if (sum < target) {
                        ++left;
                    } else {
                        --right;
                    }
                }
            }
        }
        
        return result;
    }
};
