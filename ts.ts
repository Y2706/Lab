import * as readline from 'readline';

const rl = readline.createInterface({
    input: process.stdin,
    output: process.stdout
});

// Задание 10
function factorialZeros() {
    rl.question('Enter N: ', (input) => {
        const N = parseInt(input);
        let Nf = 0;
        for (let i = 5; i <= N; i *= 5) {
            Nf += Math.floor(N / i);
        }
        console.log(Nf);
        menu();
    });
}

// Задание 6
function romanToInt() {
    rl.question('Enter Roman number: ', (A) => {
        const M: Record<string, number> = {
            'I': 1, 'V': 5, 'X': 10, 'L': 50,
            'C': 100, 'D': 500, 'M': 1000
        };
        let B = 0;
        for (let k = 0; k < A.length; k++) {
            if (k < A.length - 1 && M[A[k]] < M[A[k + 1]]) {
                B -= M[A[k]];
            } else {
                B += M[A[k]];
            }
        }
        console.log(B);
        menu();
    });
}

// Задание 26
function reverseAscendingNumbers() {
    rl.question('Enter numbers separated by spaces: ', (input) => {
        const numbers = input.trim().split(/\s+/).map(Number);
        const result: number[] = [];
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
        console.log(result.join(' '));
        menu();
    });
}

function menu() {
    console.log("\nChoose task:");
    console.log("1. Factorial Zeros (Task 10)");
    console.log("2. Roman to Int (Task 6)");
    console.log("3. Reverse Ascending Numbers (Task 26)");
    console.log("4. Exit");
    
    rl.question('Your choice: ', (choice) => {
        switch (choice) {
            case '1': factorialZeros(); break;
            case '2': romanToInt(); break;
            case '3': reverseAscendingNumbers(); break;
            case '4': rl.close(); break;
            default: 
                console.log("Invalid choice");
                menu();
        }
    });
}

console.log("Welcome to Unified Tasks!");
menu();
