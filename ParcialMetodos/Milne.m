function ML = Milne(f, a, b, ya, M)

    % Entrada  - f funcion creada con @
%          - a y b son los extremos izquierdo y derecho
%          - ya es la condicion inicial  y(a)
%          - M es el numero de pasos
% Salida   - E = [T', Y'] donde T es el vector de abscisas y
%            Y es el vector de ordenadas

%  METODOS NUMERICOS: Programas en Matlab
% (c) 2004 por John H. Mathews y Kurtis D. Fink
%  Software complementario acompa�ando al texto:
%  METODOS NUMERICOS con Matlab, Cuarta Edicion
%  ISBN: 0-13-065248-2
%  Prentice-Hall Pub. Inc.
%  One Lake Street
%  Upper Saddle River, NJ 07458

f=@(x,y) 1+(x-y)^2;
a=3;
b=6;
ya=2.5;
M=20;



h = (b - a) / M;
T = zeros(1, M+1);
Y = zeros(1, M+1);
T = a:h:b;
Y(1) = ya;

for  j = 1:3
    k1 = feval(f, T(j),Y(j));
    k2 = feval(f, T(j) + ((2.*h)./3), Y(j) + (2.*h./3).*k1);
    Y(j+1) = Y(j) + (h/4) * (k1+3.*k2);
end

for j = 4:M
    k1 = feval(f, T(j), Y(j));
    k2 = feval(f, T(j-1), Y(j-1));
    k3 = feval(f, T(j-2), Y(j-2));
        
    Y(j+1) = Y(j-3)+(4.*h./3).*(2.*k1-k2+2.*k3);
end 

ML = [T', Y'];