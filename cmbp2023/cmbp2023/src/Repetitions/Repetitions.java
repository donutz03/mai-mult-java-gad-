package Repetitions;

import java.util.Scanner;

public class Repetitions {

    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        String str = sc.next();
        int n = str.length();
        char caracterCurent = str.charAt(0);
        int lungimeCurenta = 1;
        int lungimeMaxima = 1;
        int i;
        for (i = 1; i < n; i++) {
            if (str.charAt(i) == caracterCurent) {
                lungimeCurenta++;
            } else {
                caracterCurent = str.charAt(i);
                lungimeCurenta = 1;
            }
            lungimeMaxima = Math.max(lungimeCurenta, lungimeMaxima);
        }
        System.out.println(lungimeMaxima);
    }

}
