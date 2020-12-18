format short
clear all
clc

%-----------------------------------------------
f=@(x,y)[-exp(-10/(y(2)+273))*y(1) ; 1000*exp(-10/(y(2)+273))*y(1)-10*(y(2)-20)];

a=1;
b=2;
N=100;
ya=[1,25];
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