#include <iostream>
#include <string>
#include <map>
using namespace std;

// Задание 10
void factorial_zeros() {
    int N;
    cin >> N;
    int Nf = 0;
    for (int i = 5; i <= N; i *= 5) {
        Nf += N / i;
    }
    cout << Nf << endl;
}

// Задание 6
void roman_to_int() {
    string A;
    cin >> A;
    map<char, int> M = {
       {'I', 1}, {'V', 5}, {'X', 10}, {'L', 50},
       {'C', 100}, {'D', 500}, {'M', 1000}
    };
    int B = 0;
    for (int k = 0; k < A.size(); k++) {
        if (k < A.size() - 1 && M[A[k]] < M[A[k + 1]]) {
            B -= M[A[k]];
        } else {
            B += M[A[k]];
        }
    }
    cout << B << endl;
}

// Задание 26
void reverse_ascending_numbers() {
    int n;
    while (cin >> n) {
        int rev = 0, t = n, prev = 10, ok = 1;
        while (t) {
            if (t % 10 >= prev) {
                ok = 0;
                break;
            }
            prev = t % 10;
            t /= 10;
        }
        if (ok && n != 0) {
            t = n;
            rev = 0;
            while (t) {
                rev = rev * 10 + t % 10;
                t /= 10;
            }
            cout << rev << " ";
        }
    }
    cout << endl;
}

int main() {
    cout << "Task 10 (Factorial Zeros):" << endl;
    factorial_zeros();
    
    cout << "Task 6 (Roman to Int):" << endl;
    roman_to_int();
    
    cout << "Task 26 (Reverse Ascending Numbers):" << endl;
    reverse_ascending_numbers();
    
    return 0;
}
