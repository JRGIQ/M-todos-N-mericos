clc %permite borrar el area de trabajo
clear %permite borrar las variables almacenadas
format long %permite utilizar la maxima capacidad de la maquina

%------------------- DATOS IMPORTANTES------------------------
n = 4; % Número de ecuaciones
A = zeros(n,n+1);
x1 = zeros(1,n);
 
% b = [4,4,4];
% A=[4,1,1,0,1,b(1);-1,-3,1,1,0,b(2);2,1,5,-1,-1,b(3);-1,-1,-1,4,0,b(4);0,2,-1,1,1,b(5)];
%AA=[4,1,1,0,1;-1,-3,1,1,0;2,1,5,-1,-1;-1,-1,-1,4,0;0,2,-1,1,1];
x1=[0,3,-2,1];
A=[4,-1,0,0,5;-1,4,-1,0,-3;0,-1,4,-1,8;0,0,-1,4,13];
AA=[4,-2,0,0;-1,4,-1,0;0,-1,4,-1;0,0,-1,4];

% A=[2,-1,0,0,4;1,2,-3,0,-2;0,-1,3,-3,-1;0,0,-1,3,1];
% AA=[2,-1,0,0;1,2,-3,0;0,-1,3,-3;0,0,-1,3];

tol = 1e-6;
m = 1; % Número de iteraciones
w = 1.04464;

d=diag(diag(AA)); %obtencion de la matriz diagonal
l=d-tril(AA); %obtencion de la matriz diagonal superior L
u=d-triu(AA); %obtencion de la matriz diagonal inferior u

Tsor=((d-w*l)^-1)*((1-w)*d+w*u); % Matriz de iteración método SOR
RadioEspectral=max(abs(eig(Tsor))) %calculo del radio espectral
if RadioEspectral>1
disp('Radio Espectral mayor que 1')
disp('EL MÉTODO NO CONVERGE')

else
    disp('EL METODO CONVERGE')
end
 
 
 k = 1;
 while  k <= m
   err = 0;

   for i = 1 : n
      s = 0;
      for j = 1 : n
        s = s-A(i,j)*x1(j);
      end
      s = w*(s+A(i,n+1))/A(i,i);
      if abs(s) > err
         err = abs(s);
      end
      x1(i) = x1(i)+s;
   end
   if err <= tol 
      break;
   else

      k = k+1;
   end
 end

 fprintf('The solution vector after %d iterations is :\n', k);
 for i = 1 : n
 fprintf('   %11.8f \n', x1(i));
 end
 

