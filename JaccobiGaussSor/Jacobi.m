% Jacobi method
clc %permite borrar el area de trabajo
clear %permite borrar las variables almacenadas
format long %permite utilizar la maxima capacidad de la maquina
%------------------------DATOS IMPORTANTES----------------------------
%A=[x1,x2,x3......b]

n=4; % Número de ecuaciones nxn
A = zeros(n,n+1);
x1 = zeros(n);
x2 = zeros(n);
tol = 1e-8; % Tolerancia
m = 100; % Número de iteraciones


A=[-4/3,1/9,1/9,0,-2013;1/9,-4/3,0,1/9,-3019;1/9,0,-4/3,1/9,-20;0,1/9,1/9,-4/3,-17019];
AA=[-4/3,1/9,1/9,0;1/9,-4/3,0,1/9;1/9,0,-4/3,1/9;0,1/9,1/9,-4/3];
x1=[0,120,60,50]; % Punto inicial
 %-----------------------------------------------------------------------

determinante=det(AA);%se calcula el determinante de la matriz de coeficiente

if determinante==0
disp('El determinante es cero, el problema no tiene solución única')
end

d=diag(diag(AA)); %obtencion de la matriz diagonal
l=d-tril(AA); %obtencion de la matriz diagonal superior L
u=d-triu(AA); %obtencion de la matriz diagonal inferior u


T=((d)^-1)*(l+u) % matriz de transicion de gauss
RadioEspectral=max(abs(eig(T))) %calculo del radio espectral
if RadioEspectral>1
disp('Radio Espectral mayor que 1')
disp('EL MÉTODO NO CONVERGE')

else
    disp('EL METODO CONVERGE')
end

 
k = 1;
 while k <= m
   err = 0;
   for i = 1 : n
      s = 0;
      for j = 1 : n
        s = s-A(i,j)*x1(j);
      end
      s = (s+A(i,n+1))/A(i,i);
      if abs(s) > err
        err = abs(s);
      end
      x2(i) = x1(i)+s;
  end

  if err <= tol
     break;
  else
     k = k+1;
     for i = 1 : n
       x1(i) = x2(i);
     end
  end
 end

 fprintf('Solution vector after %d iterations is :\n', k-1);
 for i = 1 : n
    fprintf(' %11.8f \n', x2(i));
 end