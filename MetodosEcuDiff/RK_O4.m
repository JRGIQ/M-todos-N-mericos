format long 
clear all
clc

% f=@(x,y) [y-y+x;3*x^2+2*abs(y);cos(2*y)+exp(-x)];

f=@(x,y) (y*cos(x)+2*x*exp(y))/(sin(x)+x^2*exp(y)+2);
a=1;
b=2;
N=3;

h=(b-a)/N;
t=linspace(a,b,N+1);
ya=[0];
w=zeros(length(ya),length(t));

for i=1:length(ya)
    for j=1:N
        
        w(i,1)=ya(i);
        k1=feval(f,t(j),w(i,j));
        k2=feval(f,t(j)+(h/2),w(i,j)+(h/2)*k1);
        k3=feval(f,t(j)+(h/2),w(i,j)+(h/2)*k2);
        k4=feval(f,t(j+1),w(i,j)+h*k3);


        w(i,j+1)=w(i,j)+(h/6)*(k1+2*k2+2*k3+k4);
    end
end
    
% disp(t)
% disp(w)
[t',w']