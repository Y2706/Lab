using System;
using System.Collections.Generic;

class Program
{
    // Задание 10
    static void FactorialZeros()
    {
        int N = int.Parse(Console.ReadLine());
        int Nf = 0;
        for (int i = 5; i <= N; i *= 5)
        {
            Nf += N / i;
        }
        Console.WriteLine(Nf);
    }

    // Задание 6
    static void RomanToInt()
    {
        string A = Console.ReadLine().ToUpper();
        Dictionary<char, int> M = new Dictionary<char, int>
        {
            {'I', 1}, {'V', 5}, {'X', 10}, {'L', 50},
            {'C', 100}, {'D', 500}, {'M', 1000}
        };
        int B = 0;
        for (int k = 0; k < A.Length; k++)
        {
            if (k < A.Length - 1 && M[A[k]] < M[A[k + 1]])
            {
                B -= M[A[k]];
            }
            else
            {
                B += M[A[k]];
            }
        }
        Console.WriteLine(B);
    }

    // Задание 26
    static void ReverseAscendingNumbers()
    {
        string[] numbers = Console.ReadLine().Split(new[] { ' ' }, StringSplitOptions.RemoveEmptyEntries);
        foreach (string numStr in numbers)
        {
            if (int.TryParse(numStr, out int n))
            {
                int t = n, prev = 10, ok = 1;
                while (t != 0)
                {
                    if (t % 10 >= prev)
                    {
                        ok = 0;
                        break;
                    }
                    prev = t % 10;
                    t /= 10;
                }
                if (ok != 0 && n != 0)
                {
                    t = n;
                    int rev = 0;
                    while (t != 0)
                    {
                        rev = rev * 10 + t % 10;
                        t /= 10;
                    }
                    Console.Write(rev + " ");
                }
            }
        }
        Console.WriteLine();
    }

    static void Main()
    {
        Console.WriteLine("Task 10 (Factorial Zeros):");
        FactorialZeros();
        
        Console.WriteLine("Task 6 (Roman to Int):");
        RomanToInt();
        
        Console.WriteLine("Task 26 (Reverse Ascending Numbers):");
        ReverseAscendingNumbers();
    }
}
