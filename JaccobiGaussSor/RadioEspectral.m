clc %permite borrar el area de trabajo
clear %permite borrar las variables almacenadas
format long %permite utilizar la maxima capacidad de la maquina

A=[4,7,-1;2,-4,-3;-1,3,-5];
w=-1/2;
d=diag(diag(A)); %obtención de la matriz diagonal
l=d-tril(A); %obtención de la matriz diagonal superior L
u=d-triu(A); %obtención de la matriz diagonal inferior u
Tg=((d-l)^-1)*u; % matriz de transicion de gauss
Tsor=((d-w*l)^-1)*((1-w)*d+w*u);
Tj=((d)^-1)*(l+u);
Rj=max(abs(eig(Tj))) %calculo del radio espectral
Rg=max(abs(eig(Tg)))
Rs=max(abs(eig(Tsor)))
e=max(eig(A));




