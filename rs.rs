use std::collections::HashMap;
use std::io;
use std::io::BufRead;

// Задание 10
fn factorial_zeros() {
    let mut input = String::new();
    io::stdin().read_line(&mut input).unwrap();
    let n: i32 = input.trim().parse().unwrap();
    let mut nf = 0;
    let mut i = 5;
    while i <= n {
        nf += n / i;
        i *= 5;
    }
    println!("{}", nf);
}

// Задание 6
fn roman_to_int() {
    let mut input = String::new();
    io::stdin().read_line(&mut input).unwrap();
    let a = input.trim();
    let mut m: HashMap<char, i32> = HashMap::new();
    m.insert('I', 1);
    m.insert('V', 5);
    m.insert('X', 10);
    m.insert('L', 50);
    m.insert('C', 100);
    m.insert('D', 500);
    m.insert('M', 1000);
    let mut b = 0;
    let chars: Vec<char> = a.chars().collect();
    for k in 0..chars.len() {
        if k < chars.len() - 1 && m[&chars[k]] < m[&chars[k + 1]] {
            b -= m[&chars[k]];
        } else {
            b += m[&chars[k]];
        }
    }
    println!("{}", b);
}

// Задание 26
fn reverse_ascending_numbers() {
    let stdin = io::stdin();
    for line in stdin.lock().lines() {
        if let Ok(line) = line {
            for word in line.split_whitespace() {
                if let Ok(n) = word.parse::<u32>() {
                    let mut t = n;
                    let mut prev = 10;
                    let mut ok = true;
                    while t > 0 {
                        if t % 10 >= prev {
                            ok = false;
                            break;
                        }
                        prev = t % 10;
                        t /= 10;
                    }
                    if ok && n != 0 {
                        t = n;
                        let mut rev = 0;
                        while t > 0 {
                            rev = rev * 10 + t % 10;
                            t /= 10;
                        }
                        print!("{} ", rev);
                    }
                }
            }
        }
    }
    println!();
}

fn main() {
    println!("Task 10 (Factorial Zeros):");
    factorial_zeros();
    
    println!("Task 6 (Roman to Int):");
    roman_to_int();
    
    println!("Task 26 (Reverse Ascending Numbers):");
    reverse_ascending_numbers();
}
