% Discretizacion en diferencias finitas centradas

h=0.1;
c1=1; % c1*y" la constante con el signo
c2=4; % c2*y'
c3=-2; % c3*y

wi=(-2*c1/h^2)+c3;
wimas1=(c1/h^2)+(c2/(2*h));
wimenos1=(c1/h^2)-(c2/(2*h));
disp('w(i-1)-----w(i)------w(i+1)')
T=[wimenos1,wi,wimas1]