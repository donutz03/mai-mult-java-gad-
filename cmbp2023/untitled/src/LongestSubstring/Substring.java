package LongestSubstring;

import java.util.ArrayList;
import java.util.List;

public class Substring {

    public int lengthOfLongestSubstring(String s) {
        List<Character> substringL = new ArrayList<>();
        int largestLength = 0;
        for (int right = 0; right < s.length(); right++) {
            if (substringL.contains(s.charAt(right))) {
                int index = substringL.indexOf(s.charAt(right));
                substringL.remove(index);
                if (index > 0) substringL.subList(0, index).clear();
            }
            substringL.add(s.charAt(right));
            largestLength = Math.max(largestLength, substringL.size());
        }
        return largestLength;
    }

    public static void main(String[] args) {
        Substring s = new Substring();
        System.out.println(s.lengthOfLongestSubstring("abcabcbb"));
        System.out.println(s.lengthOfLongestSubstring("bbbbb"));
        System.out.println(s.lengthOfLongestSubstring("pwwkew"));
    }
}
