package main

import "fmt"

// Задание 10
func factorialZeros() {
    var N int
    fmt.Scan(&N)
    Nf := 0
    for i := 5; i <= N; i *= 5 {
        Nf += N / i
    }
    fmt.Println(Nf)
}

// Задание 6
func romanToInt() {
    var A string
    fmt.Scan(&A)
    M := map[byte]int{
        'I': 1, 'V': 5, 'X': 10, 'L': 50,
        'C': 100, 'D': 500, 'M': 1000,
    }
    B := 0
    for k := 0; k < len(A); k++ {
        if k < len(A)-1 && M[A[k]] < M[A[k+1]] {
            B -= M[A[k]]
        } else {
            B += M[A[k]]
        }
    }
    fmt.Println(B)
}

// Задание 26
func reverseAscendingNumbers() {
    var n int
    for {
        _, err := fmt.Scan(&n)
        if err != nil {
            break
        }
        rev, t, prev, ok := 0, n, 10, true
        for t > 0 {
            if t%10 >= prev {
                ok = false
                break
            }
            prev = t % 10
            t /= 10
        }
        if ok && n != 0 {
            t = n
            rev = 0
            for t > 0 {
                rev = rev*10 + t%10
                t /= 10
            }
            fmt.Print(rev, " ")
        }
    }
    fmt.Println()
}

func main() {
    fmt.Println("Task 10 (Factorial Zeros):")
    factorialZeros()
    
    fmt.Println("Task 6 (Roman to Int):")
    romanToInt()
    
    fmt.Println("Task 26 (Reverse Ascending Numbers):")
    reverseAscendingNumbers()
}
