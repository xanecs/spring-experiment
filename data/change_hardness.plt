set title 'Periodendauer T in Abhängigkeit der Federhärte D'
set xlabel '1 / Wurzel der Federhärte D in (N/m)^{-1/2}'
set ylabel 'Periodendauer in s'
set fit errorvariables

k(x)=a+b*x

a = 0.0000001
b = 0.0001

fit k(x) 'change_hardness.dat' using (1/sqrt($1)):3:(1/(2*$1**(3/2))*$2):(1e-03) xyerrors via a, b

set xrange [0:0.4]
set yrange [0:1]

set terminal wxt size 800,600

kmax(x) = (a - a_err) + x * (b + b_err)
kmin(x) = (a + a_err) + x * (b - b_err)

plot 'change_hardness.dat' using  (1/sqrt($1)):3:(1/(2*$1**(3/2))*$2):(1e-03) with xyerrorbars title 'Messwerte', k(x) title 'Ausgleichsgerade', kmax(x) title 'Ausgleichsgerade maximale Steigung', kmin(x) title 'Ausgleichsgerade minimale Steigung'
