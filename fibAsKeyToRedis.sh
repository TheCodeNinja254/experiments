#!/bin/bash

# Initialize the first two Fibonacci numbers
a=0
b=1

echo "Starting Fibonacci Sequence (Infinite Loop): Also writing to cache"
echo $a
echo $b

# Loop indefinitely
while true; do
    fib=$((a + b))  # Calculate next Fibonacci number
    echo $fib
    a=$b            # Update previous values
    b=$fib

    # Define key and value
    KEY=$fib
#    I am gonna write the same thing over and over, wanna kill ram?
    VALUE="There are many variations of passages of Lorem Ipsum available,
    but the majority have suffered alteration in some form, by injected humour,
    or randomised words which don't look even slightly believable.
    If you are going to use a passage of Lorem Ipsum, you need to be
    sure there isn't anything embarrassing hidden in the middle of text.
    All the Lorem Ipsum generators on the Internet tend to repeat predefined
    chunks as necessary, making this the first true generator on the Internet.
    It uses a dictionary of over 200 Latin words, combined with a handful of
    model sentence structures, to generate Lorem Ipsum which looks reasonable.
    The generated Lorem Ipsum is therefore always free from repetition,
    injected humour, or non-characteristic words etc."

    # Write to Redis
    redis-cli SET "$KEY" "$VALUE"

    # Confirm the value is set
    echo "Stored in Redis: $(redis-cli GET "$KEY")"

    sleep 0.000005       # Optional: Slow down execution (adjust as needed) initial was 0.5, mine is greedy.
done
