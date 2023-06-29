package bufferedReader;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.util.Scanner;

public class readFromFile {

    public static void main(String[] args) throws FileNotFoundException {

        try {
            File fis = new File("C:\\Users\\User\\Desktop\\cmbp2023\\cmbp2023\\src\\bufferedReader\\file.txt");

            Scanner sc = new Scanner(fis);
            while (sc.hasNextInt()) {
                System.out.println(sc.nextInt());
            }
            sc.close();
        }
        catch (FileNotFoundException e) {
            e.printStackTrace();
        }

    }

}
