% derivar
format shortG
clear all
clc

syms 'x'
syms 'y'
% 
f=cos(3*x*y);
% 
df=diff(f,y)
% V=[0    0.0893    0.1399    0.1451    0.0867         0];
% norm(V,2)


% poner n+1 y m+1
n=4;
m=3;
x=linspace(3,19/5,n+1)
y=linspace(0,3/4,m+1)

