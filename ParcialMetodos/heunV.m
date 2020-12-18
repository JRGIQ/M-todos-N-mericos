% Entrada   - f funcion creada con @
%           - a y b son los extremos izquierdo y derecho
%           - ya es la condicion inicial  y(a)
%           - M es el numero de pasos
% Salida    - H = [T', Y'] donde  T  es el vector de abscisas y
%             Y es el vector de ordenadas

%-----------------------------------------------------------------------
%  MODIFICACION DE LA RUTINA DEL METODO DE HEUN DEL TEXTO DE MATHEWS Y 
%  FINK ADAPTADA AL TEXTO DE BURDEN Y FAIRES
%-----------------------------------------------------------------------

F=@(x,y)x*exp(3*x)-2*atan(y);;
% F=@(x,y) (y*cos(x)+2*x*exp(y))/(sin(x)+x^2*exp(y)+2);
a=0;
b=2;
Za=[0];
M=10;

h = (b - a) / M;
Z = zeros(M+1, length(Za));
T = a:h:b;
Z(1, :) = Za;
for  j = 1:M
   k1(j,:) = feval(F, T(j), Z(j, :));
   k2(j,:) = feval(F, T(j)+(h/3), Z(j, :)+(h/3)*k1(j,:));
   k3(j,:) = feval(F, T(j)+(2*h/3), Z(j, :)+(2*h/3)*k2(j,:));
   Z(j+1, :) = Z(j, :) + (h/4)*(k1(j,:) + 3*k3(j,:));
end
XY = [T', Z]