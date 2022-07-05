set xdata time
set timefmt '%H:%M:%S'
set format x '%H:%M'
set xtics rotate by -30
set ylabel '€/kWh'
set datafile separator ','
set terminal pngcairo
set output "test.png"

plot 'data.txt' using 1:2 title 'Total electricity cost' with steps, \
     'data.txt' using 1:3 title 'w/o taxes' with steps
