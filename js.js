// Задание 10
function factorialZeros() {
    const N = parseInt(prompt("Enter N:"));
    let Nf = 0;
    for (let i = 5; i <= N; i *= 5) {
        Nf += Math.floor(N / i);
    }
    console.log(Nf);
}

// Задание 6
function romanToInt() {
    const A = prompt("Enter Roman number:").toUpperCase();
    const M = { 'I': 1, 'V': 5, 'X': 10, 'L': 50, 'C': 100, 'D': 500, 'M': 1000 };
    let B = 0;
    for (let k = 0; k < A.length; k++) {
        if (k < A.length - 1 && M[A[k]] < M[A[k + 1]]) {
            B -= M[A[k]];
        } else {
            B += M[A[k]];
        }
    }
    console.log(B);
}

// Задание 26
function reverseAscendingNumbers() {
    const input = prompt("Enter numbers separated by spaces:");
    const numbers = input.trim().split(/\s+/).map(Number);
    const result = [];
    for (const n of numbers) {
        let t = n, prev = 10, ok = true;
        while (t > 0) {
            if (t % 10 >= prev) {
                ok = false;
                break;
            }
            prev = t % 10;
            t = Math.floor(t / 10);
        }
        if (ok && n !== 0) {
            t = n;
            let rev = 0;
            while (t > 0) {
                rev = rev * 10 + t % 10;
                t = Math.floor(t / 10);
            }
            result.push(rev);
        }
    }
    console.log(result.join(" "));
}

console.log("Task 10 (Factorial Zeros):");
factorialZeros();

console.log("Task 6 (Roman to Int):");
romanToInt();

console.log("Task 26 (Reverse Ascending Numbers):");
reverseAscendingNumbers();
