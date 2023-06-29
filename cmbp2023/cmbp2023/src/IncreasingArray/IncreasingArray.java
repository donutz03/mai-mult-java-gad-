package IncreasingArray;
import java.util.Scanner;

public class IncreasingArray {

    public static void main(String[] args) {

    Scanner scanner = new Scanner(System.in);
    int n = scanner.nextInt();
    int []a = new int[n];
    int i;
    for (i = 0; i < n; i++) {
        a[i] = scanner.nextInt();
    }

    long nrMutari = 0;
    for (i = 1; i < n; i++) {
        if (a[i] < a[i-1]) {
            nrMutari += a[i-1] - a[i];
            a[i] = a[i-1];
        }
    }

        System.out.println(nrMutari);

    }

}
