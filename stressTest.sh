echo "Hello, Fucktards! I am killing you!"

#!/bin/bash

# Check if stress-ng is installed
if ! command -v stress-ng &> /dev/null; then
    echo "stress-ng is not installed. Installing it now..."
    sudo apt update && sudo apt install -y stress-ng
fi

# Test duration (5 days)
DURATION="432000"

# Get number of CPU cores
CPU_CORES=$(nproc)

# Log file
LOG_FILE="cpu_ram_test.log"

echo "Starting CPU & RAM stress test for 5 days..."
echo "Logging system performance to $LOG_FILE"

# Run stress test in the background
stress-ng --cpu "$CPU_CORES" --cpu-method matrixprod --vm 2 --vm-bytes 80% --timeout "$DURATION" > /dev/null 2>&1 &

# Monitor system metrics every 30 seconds
echo "Time, CPU Usage (%), RAM Usage (MB), Temp (°C)" > "$LOG_FILE"
while [ "$(pgrep stress-ng)" ]; do
    CPU_USAGE=$(top -bn1 | grep "Cpu(s)" | awk '{print $2 + $4}')  # User + System CPU usage
    RAM_USAGE=$(free -m | awk '/Mem:/ {print $3}')  # Used RAM in MB

    echo "$(date +'%Y-%m-%d %H:%M:%S'), $CPU_USAGE, $RAM_USAGE"
    echo "$(date +'%Y-%m-%d %H:%M:%S'), $CPU_USAGE, $RAM_USAGE" >> "$LOG_FILE"
    sleep 3  # Log every 30 seconds
done

echo "Test completed! Results saved in $LOG_FILE"

echo "Atleast I used some electricity and computation, no?"
