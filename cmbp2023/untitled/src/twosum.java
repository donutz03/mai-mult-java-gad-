import java.util.HashMap;
import java.util.Map;

public class twosum {

    public int[] twoSum(int[] nums, int target) {
        int dif;
        int otherIndex;
        int indexes[] = new int[2];
        Map<Integer, Integer> map = new HashMap<>();
        for (int i = 0; i < nums.length; i++)
        {

            dif = target - nums[i];
            if (map.containsKey(dif))
            {   otherIndex = map.get(dif);
                indexes[0] = i;
                indexes[1] = otherIndex;
                return indexes;
            }
            else map.put(nums[i], i);
        }


        return indexes;
    }


    public static void main(String[] args) {
        twosum t = new twosum();
        int[] result = t.twoSum(new int[]{2, 7, 11, 15}, 9);
        System.out.print("[");
        for (int i = 0; i < result.length; i++) {
            System.out.print(result[i]);
            if (i != result.length - 1) {
                System.out.print(", ");
            }
        }
        System.out.println("]");
    }

}
