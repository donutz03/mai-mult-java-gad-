package TwoSum;

import java.util.HashMap;
import java.util.Map;

public class TwoSum {

    public int[] twoSum(int[] nums, int target) {
        HashMap<Integer, Integer> prevMap = new HashMap<>();

        for (int i = 0; i < nums.length; i++) {
            int num = nums[i];
            int diff = target - num;

            if (prevMap.containsKey(diff)) {
                return new int[] {prevMap.get(diff), i};
            }
            prevMap.put(num, i);
        }
        return new int[] {};
    }

    public static void main(String[] args) {
        TwoSum twoSum = new TwoSum();
        int [] arr = twoSum.twoSum(new int[] {1, 2, 5, 1, 10}, 12);
        for (int i = 0 ; i < 2; i++) System.out.println(arr[i]);
    }

}
