format short
clear all
clc

x0=[2.4,2.5];
y0=[75.1623,109.3636];

x=2.44;

m=(y0(2)-y0(1))/(x0(2)-x0(1));

y= y0(1)+m*(x-x0(1))