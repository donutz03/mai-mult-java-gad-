package Greedy2;

public class Greedy2 {

    public boolean canJump(int[] nums) {
        int goal = nums.length - 1;
        for (int i = nums.length - 2; i >= 0; i--) {
            if (nums[i] + i >= goal) {
                goal = i;
            }
        }
        return goal == 0;

    }

    public static void main(String[] args) {
        Greedy2 greedy2 = new Greedy2();
        System.out.println(greedy2.canJump(new int[] {2, 3, 1, 1, 4}));
    }
}
