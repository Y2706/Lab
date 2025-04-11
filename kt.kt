fun main() {
    println("Task 10 (Factorial Zeros):")
    factorialZeros()
    
    println("Task 6 (Roman to Int):")
    romanToInt()
    
    println("Task 26 (Reverse Ascending Numbers):")
    reverseAscendingNumbers()
}

// Задание 10
fun factorialZeros() {
    val N = readLine()!!.toInt()
    var Nf = 0
    var i = 5
    while (i <= N) {
        Nf += N / i
        i *= 5
    }
    println(Nf)
}

// Задание 6
fun romanToInt() {
    val A = readLine()!!
    val M = mapOf(
        'I' to 1, 'V' to 5, 'X' to 10, 'L' to 50,
        'C' to 100, 'D' to 500, 'M' to 1000
    )
    var B = 0
    for (k in A.indices) {
        if (k < A.length - 1 && M[A[k]]!! < M[A[k + 1]]!!) {
            B -= M[A[k]]!!
        } else {
            B += M[A[k]]!!
        }
    }
    println(B)
}

// Задание 26
fun reverseAscendingNumbers() {
    val numbers = readLine()!!.split(" ").map { it.toInt() }
    for (n in numbers) {
        var t = n
        var prev = 10
        var ok = true
        while (t > 0) {
            if (t % 10 >= prev) {
                ok = false
                break
            }
            prev = t % 10
            t /= 10
        }
        if (ok && n != 0) {
            t = n
            var rev = 0
            while (t > 0) {
                rev = rev * 10 + t % 10
                t /= 10
            }
            print("$rev ")
        }
    }
    println()
}
