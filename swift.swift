import Foundation

// Задание 10
func factorialZeros() {
    guard let input = readLine(), let N = Int(input) else { return }
    var Nf = 0
    var i = 5
    while i <= N {
        Nf += N / i
        i *= 5
    }
    print(Nf)
}

// Задание 6
func romanToInt() {
    guard let A = readLine() else { return }
    let M: [Character: Int] = [
        "I": 1, "V": 5, "X": 10, "L": 50,
        "C": 100, "D": 500, "M": 1000
    ]
    var B = 0
    for k in 0..<A.count {
        let currentChar = A[A.index(A.startIndex, offsetBy: k)]
        if k < A.count - 1 {
            let nextChar = A[A.index(A.startIndex, offsetBy: k + 1)]
            if M[currentChar]! < M[nextChar]! {
                B -= M[currentChar]!
            } else {
                B += M[currentChar]!
            }
        } else {
            B += M[currentChar]!
        }
    }
    print(B)
}

// Задание 26
func reverseAscendingNumbers() {
    guard let input = readLine()?.split(separator: " ").compactMap({ Int($0) }) else { return }
    for n in input {
        var t = n
        var prev = 10
        var ok = true
        while t != 0 {
            if t % 10 >= prev {
                ok = false
                break
            }
            prev = t % 10
            t /= 10
        }
        if ok && n != 0 {
            t = n
            var rev = 0
            while t != 0 {
                rev = rev * 10 + t % 10
                t /= 10
            }
            print(rev, terminator: " ")
        }
    }
    print()
}

print("Task 10 (Factorial Zeros):")
factorialZeros()

print("Task 6 (Roman to Int):")
romanToInt()

print("Task 26 (Reverse Ascending Numbers):")
reverseAscendingNumbers()
