package pbleet;

import java.util.HashSet;
import java.util.Set;

public class Pb {

        public boolean containsDuplicate(int[] nums) {
            int i;
            Set<Integer> uniques = new HashSet<>();
            for (i = 0 ; i < nums.length; i++) {
                if (uniques.contains(nums[i]))
                    return true;
                uniques.add(nums[i]);
            }

            return false;
        }

    public static void main(String[] args) {
        Pb containsDup = new Pb();
        System.out.println(containsDup.containsDuplicate(new int[]{1, 2, 9, 3}));
    }

}
