format long
clear all
clc

%-----------------------------------------------
f=@(x,y)[0.026*(1-(y/12000))*y];

a=1950;
b=2070;
N=120;
ya=[2555];
%--------------------------------------

h=(b-a)/N;
t=linspace(a,b,N+1);
w=zeros(N+1, length(ya));
w(1,:)=ya;
for i=1:N
    k1(i,:)=feval(f,t(i)+(h/2),w(i,:)+(h/2)*feval(f,t(i),w(i,:)));
    w(i+1,:)=w(i,:)+h*k1(i,:);
end

AB = [t',w]