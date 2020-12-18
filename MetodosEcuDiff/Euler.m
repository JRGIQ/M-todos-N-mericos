format short
clear all
clc

%-----------------------------------------------
f=@(x,u) [u(2);cos(x)-exp(-x)*u(2)+u(1)*atan(x);u(4);-exp(-x)*u(4)+u(3)*atan(x)];

a=1;
b=2.2;
N=3;
ya=[5,0,0,1];
beta=-2;
%--------------------------------------

h=(b-a)/N;
t=linspace(a,b,N+1);
w=zeros(N+1, length(ya));
y=zeros(1, N+1);
w(1,:)=ya;

for i=1:N
    k1(i,:)=feval(f,t(i),w(i,:));
    w(i+1,:)=w(i,:)+h*k1(i,:);
end
XY = [t',w]

for j=1:N+1
   
    y(j)=w(j,1)+((beta-w(N+1,1))/(w(N+1,3)))*w(j,3);
    
end

r=[t',y']
