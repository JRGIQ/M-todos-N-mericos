# -*- coding: utf-8 -*-
"""
Created on Wed Sep 30 16:58:14 2020

@author: JRGIQ
"""


import numpy as np


xk=np.array([-1,0,3,5])
yk=np.array([5.8,-1.3,6.8,-3.56])
print(" Spline natural = 1\n Spline sujeto = 2\n Spline curvatura = 3\n Spline parabolico = 4\n Spline extrapolado = 5")
tipoSplin=1#int(input("Ingrese el tipo de spline = "))
print("\n"*50)
h=np.zeros(len(yk)-1)
A=np.zeros((len(h)-1,(len(yk))))
b=np.zeros((len(h)-1))
B=np.zeros((len(h)-1,(len(yk)-2)))
d=np.zeros(len(h))


a=yk  
     

for i in range(len(yk)-1):
    
    h[i]=xk[i+1]-xk[i]



for j in range(len(h)-1):
    

    A[j,j]=h[j]
    A[j,j+1]=2*(h[j]+h[j+1])
    A[j,j+2]=h[j+1]
    b[j]=((3/h[j+1])*(a[j+2]-a[j+1]))-((3/h[j])*(a[j+1]-a[j]))
    
    
    
    # A[0,0]=A[j,0]
    # A[1-j,1-j]=0
    # if tipoSplin==1:
        
  
  

        
    for m in range(len(yk)-2):
        
        B[j,m]=A[j,m+1]
    
  

          
x = (np.linalg.inv(B)*b)
c=np.zeros(len(B))
C=np.zeros(len(yk))
        
for n in range(len(x)):
    
    c[n]=sum(x[n])

    print(" c({})  = ".format(n+1)," {} ".format(c[n]))
    
    C[n+1]=round(c[n],6)   
    
bi=np.zeros(len(h))

print("__"*50)    
print("Spline cúbico natural para los puntos es : \n")
for m in range(len(h)):    

     
    d[m]=round(((C[m+1]-C[m])/(3*h[m])),6)
    bi[m]=round(((a[m+1]-a[m])/(h[m]))-((2*C[m]+C[m+1])*(h[m]/3)),6)
    
    print("{}".format(a[m]),"+ {}".format(bi[m]),"(x-({}))".format(xk[m]),"+ {}".format(C[m]),"(x-({}))^2".format(xk[m]),"+ {}".format(d[m]),"(x-({}))^3".format(xk[m]))
    
print("__"*50) 
print("A- Matriz--c0,c1,c2...cn= ")
print(A)
# print("b = ")
print(b)
print("B- Matriz spline natural--c1,c2,c3...cn donde c0 y cn =0 ")
print(B)
# print("C- C1,C2,...Cn-1")
# print(C)
# print("d--d0,d1,...dn")
# print(d)
# print("b--b0,b1,...bn")
# print(a)








