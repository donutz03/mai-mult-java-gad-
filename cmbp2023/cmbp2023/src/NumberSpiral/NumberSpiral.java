package NumberSpiral;

import java.util.Scanner;

public class NumberSpiral {

    public static void main(String[] args) {
        int t;
        long y, x;
        long rez;
        Scanner sc = new Scanner(System.in);
        t = sc.nextInt();
        int count = 1;
        while (count <=t) {
            y = sc.nextLong();
            x = sc.nextLong();
            rez = (Math.multiplyExact(Math.max(x, y), Math.max(x, y)) - (Math.min(x, y) - 1));
            System.out.println(rez);
            count++;
        }

    }

}
