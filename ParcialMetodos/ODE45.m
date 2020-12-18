format shortG
clear all
clc

 
x0=[5,-9,-5]; %100 es el valor inicial de x, 0 es valor inicial de y
f=@(x,y) [3*y(1)+2*y(2)-y(3)-1-3*x-2*sin(x);y(1)-2*y(2)+3*y(3)+6-x+2*sin(x)+cos(x);2*y(1)+4*y(3)+8-2*x];

[x,y]=ode45(f,linspace(0,2,11),x0)