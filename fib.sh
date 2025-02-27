#!/bin/bash

# Initialize the first two Fibonacci numbers
a=0
b=1

echo "Starting Fibonacci Sequence (Infinite Loop):"
echo $a
echo $b

# Loop indefinitely
while true; do
    fib=$((a + b))  # Calculate next Fibonacci number
    echo $fib
    a=$b            # Update previous values
    b=$fib
    sleep 0.000005       # Optional: Slow down execution (adjust as needed) initial was 0.5, mine is greedy.
done
