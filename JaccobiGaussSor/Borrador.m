 clc %permite borrar el area de trabajo
 clear %permite borrar las variables almacenadas
 format long %permite utilizar la maxima capacidad de la maquina
% % 5-) Matriz jacobi
% format long
% A=[0,0,1;0,0,1;0,2,0];
% %-------------------------------------
% normF=norm(A,'fro');
% %----------------------------------
% Ninf=norm(A,inf);
% max(sum(abs(A))); %% Prueba
% %---------------------------------
% B=A'*A;
% valores=eig(B)
% norma2=sqrt(max(valores))
% n2=norm(A,2)


% Jacobi method
clc %permite borrar el area de trabajo
clear %permite borrar las variables almacenadas
format long %permite utilizar la maxima capacidad de la maquina
%------------------------DATOS IMPORTANTES----------------------------
%A=[x1,x2,x3......b]

% syms x
% y=298.15;
% x=3000;
% z=(8.314*(502.75+0.0444*y*((x/y)+1)-((948874*y)/(x*y^2))))
% % f=y+(596812/z);
% raiz=vpasolve(z==4000,x)
% A=zeros(20,20);
% 
% for i 1:
%     
%     for j 1:20
%     if i=j
%         A(i,j)=4
%     if i=j-1
%         A(i,j)=-1
%     if i=j+1
%         A(i,j)=-1
%     else 
%         A(i,j)=0
% a=0.5;
% w=2;
% A=[1,a,a;a,1,a;a,a,1];
% V=eig(A)
% d=diag(diag(A)); %obtencion de la matriz diagonal
% l=d-tril(A); %obtencion de la matriz diagonal superior L
% u=d-triu(A); %obtencion de la matriz diagonal inferior u
% 
% Tg=((d-l)^-1)*u; % matriz de transicion de gauss
% Tsor=((d-w*l)^-1)*((1-w)*d+w*u);
% T=((d)^-1)*(l+u); % matriz de transicion de gauss
% 
% RadioEspectral1=max(abs(eig(T))) %calculo del radio espectral
% RadioEspectral2=max(abs(eig(Tg))) %calculo del radio espectral
% RadioEspectral3=max(abs(eig(Tsor))) %calculo del radio espectral
 AA=[-1.56742816, -1.27946443, -0.91515586, -1.29651680]'; 
