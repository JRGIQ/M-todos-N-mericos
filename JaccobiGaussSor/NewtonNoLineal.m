clc %permite borrar el area de trabajo
clear %permite borrar las variables almacenadas
format long %permite utilizar la maxima capacidad de la maquina
%function y=newtonsistema
x0=[1,1,1,1];
syms x y z w
fname= [4*x-y+z-x*w ; -x+3*y-2*z-y*w; x-2*y+3*z-z*w; x^2+y^2+z^2-1];
fprima=jacobian(fname);
tol=1e-8;  
max=100;


iter=1;
f=inline(fname);
jf=inline(fprima);
error=norm(f(x0(1),x0(2),x0(3),x0(4)));
%fprintf('error=%12.8f \n', error);
while error >=tol
    fx0=f(x0(1),x0(2),x0(3),x0(4));
    fpx0=jf(x0(1),x0(2),x0(3),x0(4));
    x1=x0-inv(fpx0)*fx0;
    fx1=f(x0(1),x0(2),x0(3),x0(4));
    error=norm((fx1),inf);
    fprintf('\n Iteración %2d \n raiz x=(%14.9f,%14.9f,%14.9f)\n |x(k)-x(k-1)|= %14.9f',iter,x1(1),x1(2),x1(3),error);
    if iter > max;
        fprintf('Número maximo de iteraciones excedido');
        return
    end
    x0=x1;
    iter=iter+1;
    
end