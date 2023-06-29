
package ReadWrite;

import java.io.*;
import java.util.Scanner;

public class CitireAfisareInFisier {

    public static void main(String[] args) {
        try {
            File inputFile = new File("C:\\Users\\User\\Desktop\\cmbp2023\\cmbp2023\\src\\ReadWrite\\input.txt");
            FileReader fileReader = new FileReader(inputFile);
            BufferedReader bufferedReader = new BufferedReader(fileReader);

            File outputFile = new File("C:\\Users\\User\\Desktop\\cmbp2023\\cmbp2023\\src\\ReadWrite\\output.txt");
            FileWriter fileWriter = new FileWriter(outputFile);
            BufferedWriter bufferedWriter = new BufferedWriter(fileWriter);
            String line;
            while ((line = bufferedReader.readLine())!= null) {
                Scanner scanner = new Scanner(line);
                while(scanner.hasNext()) {
                    String numberStr = scanner.next();
                    double number = Double.parseDouble(numberStr);
                    bufferedWriter.write(String.valueOf(number));
                    bufferedWriter.write(" ");
                }
                bufferedWriter.newLine();
                scanner.close();
            }
            bufferedReader.close();
            bufferedWriter.close();


        }
        catch (IOException e) {
            e.printStackTrace();
        }

    }

}
