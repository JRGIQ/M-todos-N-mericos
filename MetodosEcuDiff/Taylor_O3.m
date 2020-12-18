format short
clear all
clc

f=@(x,y) 1+(y/x);
dfx=@(x,y) -y/x^2;
dfy=@(x,y) 1/x;
dfxx=@(x,y) (2*y)/x^3;
dfyy=@(x,y) 0;

dfxy=@(x,y) -1/x^2;






a=1;
b=4;
N=30;
h=(b-a)/N;
t=linspace(a,b,N+1);
ya=2;
w=zeros(1,length(t));
w(1)=ya;

for i=1:N
    
    w(i+1)=w(i)+h*feval(f,t(i),w(i))+(h^2/2)*(feval(dfx,t(i),w(i))+feval(dfy,t(i),w(i))*feval(f,t(i),w(i)))+(h^3/6)*(feval(dfxx,t(i),w(i))+2*feval(dfxy,t(i),w(i))*feval(f,t(i),w(i))+feval(dfyy,t(i),w(i))*(feval(f,t(i),w(i)))^2+feval(dfy,t(i),w(i))*(feval(dfx,t(i),w(i))+feval(dfy,t(i),w(i))*feval(f,t(i),w(i))));
end
AB = [t',w']