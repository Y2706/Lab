import java.util.Scanner;
import java.util.HashMap;

public class UnifiedTasks {
    
    // Задание 10
    public static void factorialZeros() {
        Scanner scanner = new Scanner(System.in);
        int N = scanner.nextInt();
        int Nf = 0;
        for (int i = 5; i <= N; i *= 5) {
            Nf += N / i;
        }
        System.out.println(Nf);
    }
    
    // Задание 6
    public static void romanToInt() {
        Scanner scanner = new Scanner(System.in);
        String A = scanner.next();
        HashMap<Character, Integer> M = new HashMap<>() {{
            put('I', 1); put('V', 5); put('X', 10); put('L', 50);
            put('C', 100); put('D', 500); put('M', 1000);
        }};
        int B = 0;
        for (int k = 0; k < A.length(); k++) {
            if (k < A.length() - 1 && M.get(A.charAt(k)) < M.get(A.charAt(k + 1))) {
                B -= M.get(A.charAt(k));
            } else {
                B += M.get(A.charAt(k));
            }
        }
        System.out.println(B);
    }
    
    // Задание 26
    public static void reverseAscendingNumbers() {
        Scanner scanner = new Scanner(System.in);
        while (scanner.hasNextInt()) {
            int n = scanner.nextInt();
            int rev = 0, t = n, prev = 10;
            boolean ok = true;
            while (t > 0) {
                if (t % 10 >= prev) {
                    ok = false;
                    break;
                }
                prev = t % 10;
                t /= 10;
            }
            if (ok && n != 0) {
                t = n;
                rev = 0;
                while (t > 0) {
                    rev = rev * 10 + t % 10;
                    t /= 10;
                }
                System.out.print(rev + " ");
            }
        }
        System.out.println();
    }
    
    public static void main(String[] args) {
        System.out.println("Task 10 (Factorial Zeros):");
        factorialZeros();
        
        System.out.println("Task 6 (Roman to Int):");
        romanToInt();
        
        System.out.println("Task 26 (Reverse Ascending Numbers):");
        reverseAscendingNumbers();
    }
}
