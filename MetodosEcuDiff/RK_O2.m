format long 
clear all
clc

f=@(x,y) (y*cos(x)+2*x*exp(y))/(sin(x)+x^2*exp(y)+2);


a=1;
b=2;
N=3;
h=(b-a)/N;
t=linspace(a,b,N+1);
ya=0;
w=zeros(1,length(t));
w(1)=ya;

for i=1:N
    
    w(i+1)=w(i)+(2/3)*h*feval(f,t(i),w(i))+(1/3)*h*feval(f,t(i)+(3/2)*h,w(i)+(3/2)*h*feval(f,t(i),w(i)));
end

AB = [t',w']