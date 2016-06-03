set title 'Periodendauer der Schwingung in Abhängigkeit der schwingenden Masse'
set xlabel 'Wurzel der Masse m in kg^{1/2}'
set ylabel 'Periodendauer in s'
set fit errorvariables

k(x)=a+b*x

a = 0.0000001
b = 0.0001

fit k(x) 'spring2.dat' using (sqrt($1*1e-03)):2:(1e-03) yerrors via a, b

set xrange [0:0.55]
set yrange [0:0.8]

set key bottom right
set terminal wxt size 800,600

kmax(x) = (a - a_err) + x * (b + b_err)
kmin(x) = (a + a_err) + x * (b - b_err)

plot 'spring2.dat' using (sqrt($1*1e-03)):2:(1e-03) with yerrorbars title 'Messwerte Feder 2', k(x) title 'Ausgleichsgerade', kmax(x) title 'Ausgleichsgerade maximale Steigung', kmin(x) title 'Ausgleichsgerade minimale Steigung'
