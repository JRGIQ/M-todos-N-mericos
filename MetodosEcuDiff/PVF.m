format short
clear all
clc
format short

a=2;
b=3;
N=5;
x=linspace(a,b,N+1);
beta=1.2;
u=[0.7525,1.4257,1.9032,2.6083,3.4116];
v=[5.1360,5.9722,8.0318,13.3809,20.6991];

for j=1:N+1
   
    C=((beta-u(N+1))/(v(N+1)));
    y(j)=u(j)+C*v(j);
    
end

r=[x',y']
C


