format short
clear all
clc
% Entrada   - F funcion vectorial creada con @
%           - a y b son los extremos izquierdo y derecho
%           - Za = [x1(a), ... , xn(a)] las condiciones iniciales
%           - M es el numero de pasos
% Salida    - EM = [T, Z] donde  T  es el vector de abscisas y
%             Z = [x1(t), ... , xn(t)] donde  xk(t)  es la aproximacion a la
%             k-esima variable dependiente

%  METODOS NUMERICOS: Programas en Matlab
% (c) 2004 por John H. Mathews y Kurtis D. Fink
%  Software complementario acompa�ando al texto:
%  METODOS NUMERICOS con Matlab, Cuarta Edicion
%  ISBN: 0-13-065248-2
%  Prentice-Hall Pub. Inc.
%  One Lake Street
%  Upper Saddle River, NJ 07458

F=@(x,u) [u(2);cos(x)-exp(-x)*u(2)+u(1)*atan(x);u(4);-exp(-x)*u(4)+u(3)*atan(x)];
% F=@(x,y) (y*cos(x)+2*x*exp(y))/(sin(x)+x^2*exp(y)+2);
a=1;
b=2.2;
Za=[5,0,0,1];
M=3;
beta=-2;

%-----------------------------------------------------------------------------

h = (b - a) / M;
T = zeros(1, M+1);
Z = zeros(M+1, length(Za));
y = zeros(1, M+1);
T = a:h:b;
Z(1,:) = Za;
for  j = 1:M
   k1(j,:) = feval(F, T(j), Z(j, :));
   k2(j,:) = feval(F, T(j+1), Z(j, :)+h*k1(j,:));
   Z(j+1,:) = Z(j, :) + (h / 2) * (k1(j,:) + k2(j,:));
end
disp('xi----ui----ui´----vi----vi´')
AB = [T', Z]

for k=1:M+1
   
    y(k)=Z(k,1)+((beta-Z(M+1,1))/(Z(M+1,3)))*Z(k,3);
    
end

disparo=[T',y']
