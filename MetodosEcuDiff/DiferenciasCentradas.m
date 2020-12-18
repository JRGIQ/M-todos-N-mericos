% Diferencias centradas 

format short
clear all
clc

g=@(x) sen(x*y); %% uxx+uyy=g(x)

h=1/5;
k=1/4;

wij=(-2/h^2)-(2/k^2);
wimas1_j=1/h^2;
wimenos1_j=1/h^2;
wi_jmas1=1/k^2;
wi_jmenos1=1/k^2;

disp('w(i,j)---w(i+1,j)---w(i-1,j)---w(i,j+1)---w(i,j-1)')
W=[wij,wimas1_j,wimenos1_j,wi_jmas1,wi_jmenos1]