<?php
// Задание 10
function factorialZeros() {
    $N = (int)fgets(STDIN);
    $Nf = 0;
    for ($i = 5; $i <= $N; $i *= 5) {
        $Nf += (int)($N / $i);
    }
    echo $Nf . PHP_EOL;
}

// Задание 6
function romanToInt() {
    $A = trim(fgets(STDIN));
    $M = [
        'I' => 1, 'V' => 5, 'X' => 10, 'L' => 50,
        'C' => 100, 'D' => 500, 'M' => 1000
    ];
    $B = 0;
    for ($k = 0; $k < strlen($A); $k++) {
        if ($k < strlen($A) - 1 && $M[$A[$k]] < $M[$A[$k + 1]]) {
            $B -= $M[$A[$k]];
        } else {
            $B += $M[$A[$k]];
        }
    }
    echo $B . PHP_EOL;
}

// Задание 26
function reverseAscendingNumbers() {
    while (($n = fgets(STDIN)) !== false) {
        $n = (int)$n;
        $rev = 0;
        $t = $n;
        $prev = 10;
        $ok = 1;
        while ($t != 0) {
            if ($t % 10 >= $prev) {
                $ok = 0;
                break;
            }
            $prev = $t % 10;
            $t = (int)($t / 10);
        }
        if ($ok && $n != 0) {
            $t = $n;
            $rev = 0;
            while ($t != 0) {
                $rev = $rev * 10 + $t % 10;
                $t = (int)($t / 10);
            }
            echo $rev . " ";
        }
    }
    echo PHP_EOL;
}

echo "Task 10 (Factorial Zeros):\n";
factorialZeros();

echo "Task 6 (Roman to Int):\n";
romanToInt();

echo "Task 26 (Reverse Ascending Numbers):\n";
reverseAscendingNumbers();
?>
