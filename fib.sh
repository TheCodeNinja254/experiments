#!/bin/bash

# Initialize the first two Fibonacci numbers
a=0
b=1

echo "Fibonacci Sequence (Infinite Loop):"
echo $a
echo $b

# Loop indefinitely
while true; do
    fib=$((a + b))  # Calculate next Fibonacci number
    echo $fib
    a=$b            # Update previous values
    b=$fib
    sleep 0.5       # Optional: Slow down execution (adjust as needed)
done
