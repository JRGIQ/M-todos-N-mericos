format long

f=@(x,y) cos(x^2*y)+(exp(x)/(x+4));
dfx=@(x,y)exp(x)/(x + 4) - exp(x)/(x + 4)^2 - 2*x*y*sin(x^2*y);
dfy=@(x,y)-x^2*sin(x^2*y);
a=1;
b=2;
N=3;
h=(b-a)/N;
t=linspace(a,b,N+1);
ya=0;
w=zeros(1,length(t));
w(1)=ya;

for i=1:N
    
    w(i+1)=w(i)+h*feval(f,t(i),w(i))+(h^2/2)*(feval(dfx,t(i),w(i))+feval(dfy,t(i),w(i))*feval(f,t(i),w(i)));
end
plot(t,w,'o')
disp(w)
    