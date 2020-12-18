format short
clear all
clc
format long

a=2;
b=3;
N=5;
x=linspace(a,b,N+1);
beta=1.2;
u=[1.5,1.7694,2.2990,3.1144,4.3435,6.2154];
v=[0,0.0922,0.1492,0.2126,0.3010,0.4331];

for j=1:N+1
   
    y(j)=u(j)+((beta-u(N+1))/(v(N+1)))*v(j);
    
end

r=[x',y']