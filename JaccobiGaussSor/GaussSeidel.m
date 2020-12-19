clc %permite borrar el area de trabajo
clear %permite borrar las variables almacenadas
format long %permite utilizar la maxima capacidad de la maquina

%------------------- DATOS IMPORTANTES------------------------
%A=[x1,x2,x3......b]

n=4; % Número de ecuaciones
A = zeros(n,n+1);
x1 = zeros(n);
tol = 1e-3;
m = 100; % Número de iteraciones

%A=[x,y,z,b]
% b=[1,2,3];
% a=-0.099;
% AA=[1,a,0;a,1,2*a;0,2*a,1];
% A=[1,a,0,0;a,1,2*a,0;0,2*a,1,0];
A=[-5,3,0,0,4;1,-5,2,0,3;0,1,-5,1,2;1,0,1,-5,4];
AA=[-5,3,0,0;1,-5,2,0;0,1,-5,1;1,0,1,-5];
% A=[4,-1,1,7;4,-8,1,-21;-2,1,5,15]; % Matriz de coeficientes con el b
% AA=[4,-1,1;4,-8,1;-2,1,5]; % Matriz sin el termino b de Ax=b

x1=[0,0,0,0];% Punto inicial o P0    
%------------------------------------------------------------------------

determinante=det(AA)%se calcula el determinante de la matriz de coeficiente

if determinante==0
disp('El determinante es cero, el problema no tiene solución única')
end

d=diag(diag(AA)); %obtencion de la matriz diagonal
l=d-tril(AA); %obtencion de la matriz diagonal superior L
u=d-triu(AA); %obtencion de la matriz diagonal inferior u

T=((d-l)^-1)*u % matriz de transicion de gauss
RadioEspectral=max(abs(eig(T))) %calculo del radio espectral
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
       s = (s+A(i,n+1))/A(i,i);
       if abs(s) > err
         err  = abs(s);
       end
       x1(i) = x1(i) + s;
    end

    if err <= tol
      break;
    else
      k = k+1;
    end
 end

 fprintf('Solution vector after %d iterations is :\n', k-1);
 for i = 1 : n
   fprintf(' %11.8f \n', x1(i));
 end



