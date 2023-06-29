package Permutations;
import java.util.*;

public class Permutations {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        int n = sc.nextInt();

        if (n == 1) {
            System.out.println("1");
            return;
        }

        if (n < 4) {
            System.out.println("NO SOLUTION");
            return;
        }

        long[] permutation = new long[n];
        int j = 0;
        for (int i = 2; i <= n; i += 2) {
            permutation[j++] = i;
        }
        for (int i = 1; i <= n; i += 2) {
            permutation[j++] = i;
        }




        for (int i = 0; i < n; i++) {
            System.out.print(permutation[i] + " ");
        }
    }
}
