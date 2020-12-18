format short
clear all
clc

%------------------------------------------------------------
f=@(x,y) (x^-2*y)+(x*exp(2*x));
dfx=@(x,y) exp(2*x) + 2*x*exp(2*x) - (2*y)/x^3;
dfy=@(x,y) 1/x^2

a=2;
b=3;
N=10;
h=(b-a)/N;
t=linspace(a,b,N+1);
ya=-1;

%--------------------------------------------------------------



w=zeros(1,length(t));
w(1)=ya;

for i=1:N
    
    w(i+1)=w(i)+h*feval(f,t(i),w(i))+(h^2/2)*(feval(dfx,t(i),w(i))+feval(dfy,t(i),w(i))*feval(f,t(i),w(i)));
end
AB = [t',w']