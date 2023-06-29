package Container;

public class Container {



    public int maxArea(int[] height) {
        int left = 0;
        int right = height.length - 1;
        int res = 0;
        while (left < right) {
            int containerLength = right - left;
            int area = containerLength * Math.min(height[left], height[right]);
            res = Math.max(res, area);
            if (height[left] < height[right]) {
                left++;
            } else {
                right--;
            }
        }
        return res;
    }

    public static void main(String[] args) {
        Container c = new Container();
        System.out.println(c.maxArea(new int[] {1, 8, 6, 2, 5, 4, 8, 3, 7}));
    }

}
