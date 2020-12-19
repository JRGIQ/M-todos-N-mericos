clc %permite borrar el area de trabajo
clear %permite borrar las variables almacenadas
format long %permite utilizar la maxima capacidad de la maquina
%function y=newtonsistema
x0=[-1.5,1.2];
syms x y 
fname= [ log(x^2*y^2)-x*y-3; x^2-y^2-1];
fprima=jacobian(fname);
tol=1e-4;
max=100;
iter=1;
f=inline(fname);
jf=inline(fprima);
error=norm(f(x0(1),x0(2)));
fprintf('error=%12.8f \n', error);
while error >=tol
    fx0=f(x0(1),x0(2));
    fpx0=jf(x0(1),x0(2));
    x1=x0-inv(fpx0)*fx0;
    fx1=f(x0(1),x0(2));
    error=norm((fx1),12);
    fprintf(' Iter %2d raiz x=(%14.9f,%14.9f,%14.9f) \n f(x)=(%14.9f,%14.9f,%14.9f) \n',iter,x1(1),x1(2),x1(3),fx1(1),fx1(2));
    if iter > max
        fprintf('Número maximo de iteraciones excedido');
        return
    end
    x0=x1;
    iter=iter+1;
end