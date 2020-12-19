
% AA=[] % Matriz sin el coeficiente b
% d=diag(diag(AA)); %obtencion de la matriz diagonal
% l=d-tril(AA); %obtencion de la matriz diagonal superior L
% u=d-triu(AA); %obtencion de la matriz diagonal inferior u
% 
% T=((d-l)^-1)*u % matriz de transicion de gauss

A=gallery('dorr',20);
b=ones(20,1)

