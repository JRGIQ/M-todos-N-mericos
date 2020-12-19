%% TALLER
clc %permite borrar el area de trabajo
clear %permite borrar las variables almacenadas
format long %permite utilizar la maxima capacidad de la maquina

% 1-) x'--> transpuesta---> transpoise
%  x=transpose([2,-1,0,-1/2]);
% y=[-2,3,4,-3,-1,2]';
% z=[1,-1,5]';
% 
%  n1=norm(x,1); % Norma 1---máximo valor de la sumatoria de las columnas
%  nEuc=norm(x,2); % Norma Euclidea raiz(maximo valor propio de A'*A) 
%  nInf=norm(x,inf); % Norma infinito---máximo valor de la sum de las filas
%  nFrobenius=norm(x,'fro'); % Norma frobenius raiz(sumatoria de todos los elementos al cuadrado)
%--------------------------------------------------------------------------------------------------


% 2-) Matriz A
% A=[1,1,0;0,-2,1;0,0,2];
% a-) Polinomio característico
% poli=poly(A);
% b-) Valores propios
% val=eig(A);
% c-) Establezca si los valores propios tienen multiplicidad o son simples
% Mult=roots(poli);
% d-) Cada una de las normas (1,2,infinito, Frobenius) Ver numeral 1.
%    j
% i |1  2|   i=0  j=0  --1       nFrobenius= http://esfm.egormaximenko.com/linalg/Frobenius_norm_es.pdf
%   |2  1|   i=0  j=1  --4
%            i=1  j=0  --4
%            i=1  j=1  --1 ---->  raiz(1+4+4+1)=raiz(10)=3.1623

% normF=norm(A,'fro');
%---------------------------------------------------------------------------------


% 3-) Estimar lim  A^n
%             x-->inf

% A=[0.6,0.5;-0.2,1.2];
% B=[0.9,1;0,0.9];
% C=[0.6,0.5;-0.16,1.2];
% D=[0.6,0.5;-0.1,1.2];
% E=[0.99,1;0,0.99];
% F=[1,1;0,1];
%A^10000;
%B^10000;
% C^10000000 %Converge a un valor 
% D^10000
% E^100000;
% F^1000;

%-----------------------------------------------

% 4-) Matrices de Markov "Suma de las columnas igua a uno", lim n-->inf = B

% A=[1/3,1/2,1/4;1/3,0,1/4;1/3,1/2,1/2];
% Pot=A^11 %% Converge a un valor
% [V,D]=eig(A);
% Vinv=inv(V);
% pot2=V*D^11*Vinv;
% A2=V*D*Vinv;
% poly=poly(A)%% Calcula el polinomio caracteristico
% raiz=roots(poly) %% Calcula los valores propios y la multiplicidad
% Val=eig(A) %% Calcula los valores propios 

%--------------------------------------------------------------------------

%5-) 