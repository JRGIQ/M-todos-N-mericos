format short
clear all
clc


f=@(x)(x.^2)./(1+2*x);

a=0.2;
b=1.8;
h=0.1;




n=(b-a)/h;
x=linspace(a,b,n+1);

% adelante
ad=(feval(f,x+h)-feval(f,x))/h;
reg=(feval(f,x)-feval(f,x-h))/h;
prg=(feval(f,x+h)-feval(f,x-h))/2*h;
disp('xi----progresiva----regresiva----centrada')
R=[x',ad',reg',prg']

% atras

% centrada