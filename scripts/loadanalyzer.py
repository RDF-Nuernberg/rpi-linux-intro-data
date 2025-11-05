#!/usr/bin/env python3
import sys

def analyze_log(file_path):
    loads = []

    # Read the log file
    with open(file_path, 'r') as file:
        for line in file:
            timestamp, load = line.strip().split(', ')
            loads.append(float(load))

    # Calculate Peak Load
    peak_load = max(loads)

    # Calculate Average Load
    average_load = sum(loads) / len(loads)

    # Calculate Load Variance
    load_variance = sum((x - average_load) ** 2 for x in loads) / len(loads)

    # Print results
    print(f"File: {file_path}")
    print(f"Peak Load: {peak_load:.2f} kW")
    print(f"Average Load: {average_load:.2f} kW")
    print(f"Load Variance: {load_variance:.4f} kW^2")
    print()

if __name__ == "__main__":
    # Ensure a file path is provided
    if len(sys.argv) != 2:
        print("Usage: python loadanalyzer.py <log_file>")
        sys.exit(1)

    log_file = sys.argv[1]
    analyze_log(log_file)
