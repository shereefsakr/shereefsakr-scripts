grep  'After :: ' charging_trace.log | awk '{print $26 "," $27}' > AIR-Response-$1.csv

grep  'Finished' charging_trace.log | awk '{print $14 "," $15}' > Request-Response-$1.csv