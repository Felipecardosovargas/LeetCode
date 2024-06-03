import java.util.HashMap;
import java.util.Map;

public class Solution {
    public int maxPoints(int[][] points) {
        if (points.length <= 1) return points.length;

        int maxPoints = 1;
        
        for (int i = 0; i < points.length; i++) {
            Map<String, Integer> slopeMap = new HashMap<>();
            int duplicate = 0;
            int localMax = 0;
            
            for (int j = 0; j < points.length; j++) {
                if (i == j) continue;
                
                int dx = points[j][0] - points[i][0];
                int dy = points[j][1] - points[i][1];
                
                if (dx == 0 && dy == 0) {
                    duplicate++;
                    continue;
                }
                
                int gcd = gcd(dx, dy);
                dx /= gcd;
                dy /= gcd;
                
                String slope = dx + "/" + dy;
                slopeMap.put(slope, slopeMap.getOrDefault(slope, 0) + 1);
                
                localMax = Math.max(localMax, slopeMap.get(slope));
            }
            
            maxPoints = Math.max(maxPoints, localMax + duplicate + 1);
        }
        
        return maxPoints;
    }
    
    private int gcd(int a, int b) {
        if (b == 0) return a;
        return gcd(b, a % b);
    }
    
    public static void main(String[] args) {
        Solution solution = new Solution();
        
        int[][] points1 = {{1,1}, {2,2}, {3,3}};
        System.out.println(solution.maxPoints(points1)); // Output: 3
        
        int[][] points2 = {{1,1}, {3,2}, {5,3}, {4,1}, {2,3}, {1,4}};
        System.out.println(solution.maxPoints(points2)); // Output: 4
    }
}
