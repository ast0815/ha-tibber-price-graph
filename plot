set xdata time
set timefmt '%H:%M:%S'
set format x '%H:%M'
set xtics rotate by -30
set ylabel '€/kWh'
set datafile separator ','
set terminal svg
set output "prices.svg"
set title "Hourly Electricity Prices"
set key top center

plot 'today.dat' using 1:2 title 'Today' with steps, \
     'tomorrow.dat' using 1:2 title 'Tomorrow' with steps
