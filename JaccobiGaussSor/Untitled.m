clc %permite borrar el area de trabajo
clear %permite borrar las variables almacenadas
format long %permite utilizar la maxima capacidad de la maquina

A=[2,3;1,4];

d=diag(diag(A)); %obtencion de la matriz diagonal
l=d-tril(A); %obtencion de la matriz diagonal superior L
u=d-triu(A); %obtencion de la matriz diagonal inferior u


T=((d)^-1)*(l+u) % matriz de transicion de gauss
RadioEspectral=max(abs(eig(T))) %calculo del radio espectral

Tg=((d-l)^-1)*u % matriz de transicion de gauss
RadioEspectralg=max(abs(eig(Tg))) %calculo del radio espectral
