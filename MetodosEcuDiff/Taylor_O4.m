format long
clear all
clc

f=@(x,y) 1+(y/x);
dfx=@(x,y) -y/x^2;
dfy=@(x,y) 1/x;
dfxx=@(x,y) (2*y)/x^3;
dfyy=@(x,y) 0;

dfxy=@(x,y) -1/x^2;

dfxxx=@(x,y) -(6*y)/x^4;
dfxxy=@(x,y) 2/x^3;
dfxyy=@(x,y) 0;
dfyyy=@(x,y) 0;




a=1;
b=2;
N=4;
h=(b-a)/N;
t=linspace(a,b,N+1);
ya=2;
w=zeros(1,length(t));
w(1)=ya;

for i=1:N
    
    w(i+1)=w(i)+h*feval(f,t(i),w(i))+(h^2/2)*(feval(dfx,t(i),w(i))+feval(dfy,t(i),w(i))*feval(f,t(i),w(i)))+(h^3/6)*(feval(dfxx,t(i),w(i))+2*feval(dfxy,t(i),w(i))*feval(f,t(i),w(i))+feval(dfyy,t(i),w(i))*(feval(f,t(i),w(i)))^2+feval(dfy,t(i),w(i))*(feval(dfx,t(i),w(i))+feval(dfy,t(i),w(i))*feval(f,t(i),w(i))))+(h^4/24)*((feval(dfxxx,t(i),w(i))+3*feval(dfxxy,t(i),w(i))*feval(f,t(i),w(i))+feval(dfxyy,t(i),w(i))*(feval(f,t(i),w(i)))^2+feval(dfyyy,t(i),w(i))*(feval(f,t(i),w(i)))^3)+feval(dfy,t(i),w(i))*(feval(dfxx,t(i),w(i))+2*feval(dfxy,t(i),w(i))*feval(f,t(i),w(i))+feval(dfyy,t(i),w(i))*(feval(f,t(i),w(i)))^2)+3*(feval(dfx,t(i),w(i))+feval(dfy,t(i),w(i))*feval(f,t(i),w(i)))*(feval(dfxy,t(i),w(i))+feval(dfyy,t(i),w(i))*feval(f,t(i),w(i)))+(feval(dfy,t(i),w(i)))^2*(feval(dfx,t(i),w(i))+feval(dfy,t(i),w(i))*feval(f,t(i),w(i))));
end
AB = [t',w']
