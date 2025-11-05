for file in logs/sensor_data_*.log; do
    python loadanalyzer.py "$file"
done
