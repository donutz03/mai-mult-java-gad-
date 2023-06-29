package MissingNumber;
import java.util.Scanner;

public class MissingNumber {

    public static void main(String[] args) {
        int n;
        Scanner sc = new Scanner(System.in);
        n = sc.nextInt();
        int a;
        int numar = 0;
        int i;
        for  (i = 0; i < n-1; i++)
        {
            a = Integer.valueOf(sc.next());
            numar = numar + i + 1 -a;
        }
        System.out.println(numar + n);
    }


}
