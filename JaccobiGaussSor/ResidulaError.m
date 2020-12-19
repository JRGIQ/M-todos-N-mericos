clc %permite borrar el area de trabajo
clear %permite borrar las variables almacenadas
format long %permite utilizar la maxima capacidad de la maquina

A=[-5,3,0,0;1,-5,2,0;0,1,-5,1;1,0,1,-5];
b = [4,3,2,4];
x=A/b;
y=[ -1.56789019 , -1.27962575,   -0.91523517,   -1.29663693 ]';
res=b'-A*y
error=x-y

 RR=[ -0.573700000000343,   0.231780000000015,   0.086829999999871,  -0.059290000000267]'*1e-3;