%  matriz = findiff (p , q, r, a, b, alpha, beta, N)

clc %permite borrar el area de trabajo
clear %permite borrar las variables almacenadas
format long %permite utilizar la maxima capacidad de la maquina

% Entrada - p, q, r  son las funciones coeficientes de
%             f(t,x,x')=p(t)x'+q(t)x+r(t)
%           introducidas con @
%         - a y b son los extremos izquierdo y derecho
%         - alpha = x(a)  y  beta = x(b)
%         - N es el numero de pasos
% Salida  - F = [T', X']: donde T' es el vector de abscisas  1 x N  y
%           X' es el vector de ordenadas  1 x N.

p=@(x)1;
q=@(x)2;
r=@(x)(cos(x));
a=0;
b=pi/2;
alpha=-0.3;
beta=-0.1;
n=12; % Se cuentan las particiones mas los dos nodos extremos 

% Inicializar los vectores y h

% T = zeros(1,n+1);
% X = zeros(1,n-1);
Va = zeros(1,n-2);
Vb = zeros(1,n-1);
Vc = zeros(1,n-2);
Vd = zeros(1,n-1);
h = (b - a)/n;
matriz=zeros(n-1,n-1);
fx=zeros(1,n-1);
Vt=linspace(a,b,n-1);

for j=1:n-1
 Vb(j) = -h^2*feval(r,Vt(j));
end 
% Métodos Numéricos 101 FIM-UNI
Vb(1) = Vb(1) + (1 + h/2*feval(p,Vt(1)))*alpha;
Vb(n-1) = Vb(n-1) + (1 - h/2*feval(p,Vt(n-1)))*beta;
for j=1:n-1
 Vd(j) = 2 + h^2*feval(q,Vt(j));
end
for j=1:n-2
 Va(j) = -1 - h/2*feval(p,Vt(j+1));
end
for j=1:n-2
 Vc(j) = -1 + h/2*feval(p,Vt(j));
end 

% CREACIÓN DE LA MATRIZ A

for s =1:n-1
   matriz(s,s)=Vd(s);
   matrizA(s,s)=Vd(s);
   matriz(s,n)=Vb(s);
   
end
for m =1:n-2
   matriz(m,m+1)=Vc(m);
   matrizA(m,m+1)=Vc(m);
   matriz(m+1,m)=Va(m);
   matrizA(m+1,m)=Va(m);
end

% Solución exacta de la ED evaluada en xi nodo
for j=1:n-1
 fx(j)= (-1/10)*(sin(Vt(j))+3*cos(Vt(j)));
end

%%% COMIENZO JACOBI

n=n-1 ; % Número de ecuaciones nxn
A = zeros(n,n+1);
x1 = zeros(n);
x2 = zeros(n);
tol = 1e-6; % Tolerancia de una iteracion a la siguiente
m = 225; % Número de iteraciones

A=matriz;
AA= matrizA;
x1=ones(1,n); % Punto inicial
 %-----------------------------------------------------------------------

determinante=det(AA);%se calcula el determinante de la matriz de coeficiente

if determinante==0
disp('El determinante es cero, el problema no tiene solución única')
end

d=diag(diag(AA)); %obtencion de la matriz diagonal
l=d-tril(AA); %obtencion de la matriz diagonal estrictamente superior L
u=d-triu(AA); %obtencion de la matriz diagonal estrictamente inferior u


T=((d)^-1)*(l+u); % matriz de transicion de Jacobi
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
 

 
 
x=linspace(1,n,n)
Tab=table(x(1:n)'-1,Vt(1:n)',x2(1:n)',fx(1:n)','VariableNames',{'Nodo (i)','x(i)','Jacobi','y(x(i))'})
fprintf('Iteraciones necesarias Jacobi = %d \n', k-1);

plot(Vt(1:n),x2(1:n),'k-',Vt(1:n),fx(1:n),'b-','LineWidth',1.8)
legend('Jacobi','y(x)')
xlabel('x')
ylabel('f(x)')
grid('on')
 
 