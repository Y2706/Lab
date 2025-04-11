# Задание 10
def factorial_zeros
  n = gets.to_i
  total = 0
  i = 5
  while i <= n
    total += n / i
    i *= 5
  end
  puts total
end

# Задание 6
def roman_to_int
  a = gets.chomp
  m = { 'I' => 1, 'V' => 5, 'X' => 10, 'L' => 50,
        'C' => 100, 'D' => 500, 'M' => 1000 }
  b = 0
  (0...a.length).each do |k|
    if k < a.length - 1 && m[a[k]] < m[a[k + 1]]
      b -= m[a[k]]
    else
      b += m[a[k]]
    end
  end
  puts b
end

# Задание 26
def reverse_ascending_numbers
  numbers = gets.chomp.split.map(&:to_i)
  numbers.each do |n|
    t = n
    prev = 10
    ok = true
    while t > 0
      if t % 10 >= prev
        ok = false
        break
      end
      prev = t % 10
      t /= 10
    end
    if ok && n != 0
      t = n
      rev = 0
      while t > 0
        rev = rev * 10 + t % 10
        t /= 10
      end
      print "#{rev} "
    end
  end
  puts
end

puts "Task 10 (Factorial Zeros):"
factorial_zeros

puts "Task 6 (Roman to Int):"
roman_to_int

puts "Task 26 (Reverse Ascending Numbers):"
reverse_ascending_numbers
