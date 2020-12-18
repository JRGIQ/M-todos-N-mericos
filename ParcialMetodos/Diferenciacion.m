format short
clear all
clc


f=@(x)(1-(x-1).^2).*exp(-x);

a=0.4;
b=1.6;
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