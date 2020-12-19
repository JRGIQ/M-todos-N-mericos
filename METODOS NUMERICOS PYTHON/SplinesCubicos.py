# -*- coding: utf-8 -*-
"""
Created on Thu Oct  1 17:12:01 2020

@author: JRGIQ
"""

import numpy as np


xk=np.array([-3,-1,2,3,7])
yk=np.array([5,4,12,6,0])
df2Sxo=-1
df2Sxn=2

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
    
    


    
print("Sistema para todas Co...c4= ")
print("A = ")
print(A)
print("b = ")
print(b)








