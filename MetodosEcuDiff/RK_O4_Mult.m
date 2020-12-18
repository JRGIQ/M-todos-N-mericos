format shortG
clear all
clc
% a1=0.312
% a2=47.7
% a3=3.374
% a4=1.268

% f=@(x,y1,y2,y3) [y2-y3+x;3*x^2+2*abs(y1);cos(2*y2)+exp(-x)];
% f=@(x,y1,y2,y3) [y2;(45*exp(2*x)+5*y2+3*y1)/2;0];
% f=@(x,y1,y2,y3) (y1*cos(x)+2*x*exp(y1))/(sin(x)+x^2*exp(y1)+2);
f=@(x,y1,y2,y3,y4) [y3;y2;y4-cos(x)*y2-3*log(y2);y4-atan(y1)];

a=2;
b=6;
N=10;
ya=[1,-1,1,-1];
%---------------------------------------------------------------------%




h=(b-a)/N;
t=linspace(a,b,N+1);
k1=zeros(N+1,length(ya));
k2=zeros(N+1,length(ya));
k3=zeros(N+1,length(ya));
k4=zeros(N+1,length(ya));
w=zeros(N+1,length(ya));
w(1, :) = ya;
for i=1:N          
        k1(i,:)=feval(f,t(i),w(i,1),w(i,2),w(i,3),w(i,4));
        k2(i,:)=feval(f,t(i)+(h/2),w(i,1)+(h/2)*k1(i,1),w(i,2)+(h/2)*k1(i,2),w(i,3)+(h/2)*k1(i,3),w(i,4)+(h/2)*k1(i,4));
        k3(i,:)=feval(f,t(i)+(h/2),w(i,1)+(h/2)*k2(i,1),w(i,2)+(h/2)*k2(i,2),w(i,3)+(h/2)*k2(i,3),w(i,4)+(h/2)*k2(i,4));
        k4(i,:)=feval(f,t(i+1),w(i,1)+h*k3(i,1),w(i,2)+h*k3(i,2),w(i,3)+h*k3(i,3),w(i,4)+h*k3(i,4));
        w(i+1,:)=w(i,:)+(h/6)*(k1(i,:)+2*k2(i,:)+2*k3(i,:)+k4(i,:));
%         s=s+1;
end      

AB = [t', w]


