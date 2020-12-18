format long 
clear all
clc

f=@(x,u) [u(2);cos(x)-exp(-x)*u(2)+u(1)*atan(x);u(4);-exp(-x)*u(4)+u(3)*atan(x)];


a=1;
b=2.2;
N=3;
h=(b-a)/N;
t=linspace(a,b,N+1);
ya=[5,0,0,1];
beta=-2;
w=zeros(1,length(t));
w(1,:)=ya;

for i=1:N
    
    w(i+1)=w(i)+(h/2)*(feval(f,t(i),w(i))+feval(f,t(i+1),w(i)+h*feval(f,t(i),w(i))));
end

AB = [t',w']