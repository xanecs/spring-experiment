set title 'Federhärten'
set xlabel 'Masse m in kg'
set ylabel 'Auslenkung der Feder s in m'
set fit errorvariables

d1(x)=a1+b1*x
d2(x)=a2+b2*x
d3(x)=a3+b3*x
d4(x)=a4+b4*x
d5(x)=a5+b5*x
d6(x)=a6+b6*x

a1=0.0000001
a2=0.0000001
a3=0.0000001
a4=0.0000001
a5=0.0000001
a6=0.0000001

b1=0.0001
b2=0.0001
b3=0.0001
b4=0.0001
b5=0.0001
b6=0.0001

fit d1(x) 'hardness.dat' using ($1*1e-03):($2*1e-03):(5e-03) yerrors via a1, b1
fit d2(x) 'hardness.dat' using ($1*1e-03):($3*1e-03):(5e-03) yerrors via a2, b2
fit d3(x) 'hardness.dat' using ($1*1e-03):($4*1e-03):(5e-03) yerrors via a3, b3
fit d4(x) 'hardness.dat' using ($1*1e-03):($5*1e-03):(5e-03) yerrors via a4, b4
fit d5(x) 'hardness.dat' using ($1*1e-03):($6*1e-03):(5e-03) yerrors via a5, b5
fit d6(x) 'hardness.dat' using ($1*1e-03):($7*1e-03):(5e-03) yerrors via a6, b6

dmax1(x) = (a1 - a1_err) + x * (b1 + b1_err)
dmin1(x) = (a1 + a1_err) + x * (b1 - b1_err)
dmax2(x) = (a2 - a2_err) + x * (b2 + b2_err)
dmin2(x) = (a2 + a2_err) + x * (b2 - b2_err)
dmax3(x) = (a3 - a3_err) + x * (b3 + b3_err)
dmin3(x) = (a3 + a3_err) + x * (b3 - b3_err)
dmax4(x) = (a4 - a4_err) + x * (b4 + b4_err)
dmin4(x) = (a4 + a4_err) + x * (b4 - b4_err)
dmax5(x) = (a5 - a5_err) + x * (b5 + b5_err)
dmin5(x) = (a5 + a5_err) + x * (b5 - b5_err)
dmax6(x) = (a6 - a6_err) + x * (b6 + b6_err)
dmin6(x) = (a6 + a6_err) + x * (b6 - b6_err)

set xrange [0:0.55]
set yrange [0:0.55]

set terminal wxt size 800,600
set key top left

plot \
'hardness.dat' using ($1*1e-03):($2*1e-03):(5e-03) with yerrorbars title 'Feder 1', d1(x) title 'Ausgleichsgerade Feder 1', \
'hardness.dat' using ($1*1e-03):($3*1e-03):(5e-03) with yerrorbars title 'Feder 2', d2(x) title 'Ausgleichsgerade Feder 2', \
'hardness.dat' using ($1*1e-03):($4*1e-03):(5e-03) with yerrorbars title 'Feder 3', d3(x) title 'Ausgleichsgerade Feder 3', \
'hardness.dat' using ($1*1e-03):($5*1e-03):(5e-03) with yerrorbars title 'Feder 4', d4(x) title 'Ausgleichsgerade Feder 4', \
'hardness.dat' using ($1*1e-03):($6*1e-03):(5e-03) with yerrorbars title 'Feder 5', d5(x) title 'Ausgleichsgerade Feder 5', \
'hardness.dat' using ($1*1e-03):($7*1e-03):(5e-03) with yerrorbars title 'Feder 6', d6(x) title 'Ausgleichsgerade Feder 6'
