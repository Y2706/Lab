# Задание 10
def factorial_zeros():
    n = int(input())
    total = 0
    i = 5
    while i <= n:
        total += n // i
        i *= 5
    print(total)

# Задание 6
def roman_to_int():
    A = input().strip()
    M = {'I': 1, 'V': 5, 'X': 10, 'L': 50, 'C': 100, 'D': 500, 'M': 1000}
    B = 0
    for k in range(len(A)):
        if k < len(A) - 1 and M[A[k]] < M[A[k + 1]]:
            B -= M[A[k]]
        else:
            B += M[A[k]]
    print(B)

# Задание 26
def reverse_ascending_numbers():
    numbers = list(map(int, input().split()))
    for n in numbers:
        t = n
        prev = 10
        ok = True
        while t > 0:
            if t % 10 >= prev:
                ok = False
                break
            prev = t % 10
            t = t // 10
        if ok and n != 0:
            t = n
            rev = 0
            while t > 0:
                rev = rev * 10 + t % 10
                t = t // 10
            print(rev, end=' ')
    print()

if __name__ == "__main__":
    print("Task 10 (Factorial Zeros):")
    factorial_zeros()
    
    print("Task 6 (Roman to Int):")
    roman_to_int()
    
    print("Task 26 (Reverse Ascending Numbers):")
    reverse_ascending_numbers()
