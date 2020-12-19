# -*- coding: utf-8 -*-
"""
Created on Mon Sep 28 05:50:41 2020

@author: JRGIQ
"""

import numpy as np
import math as mt


x=np.array([2,2.5,3.2,4])
y=np.array([8,14,15,8])

Y=np.log(y)  ## y=Cexp(Ax)  
X=x


# Y=np.log(y)  ## y=CA^x
# X=np.log(x)

# Y=1/y   ###   1/Cx+A
# X=x


# Y =y  ##  A/x+C
# X=1/x


X2=X**2
X3=x**3
X4=x**4

matriz=np.zeros((3,3))

matriz[0,0]=sum(X**2)
matriz[0,1]=sum(X)
matriz[0,2]=sum(X*Y)
matriz[1,0]=sum(X)
matriz[1,1]=sum(Y)
matriz[1,2]=len(Y)


A = np.matrix([[sum(X**2), sum(X)],[sum(X), len(Y)]])
b = np.matrix([[sum(X*Y)],[sum(Y)]])
x = (A**-1)*b


print("X^4 = ", sum(X4))
print("X^3 = ", sum(X3))
print("X^2 = ", sum(X2))

print("X =" ,sum(X))

print("X^2*Y =", sum(Y*X**2))


print("X*Y = ", sum(X*Y))

print("m = ",len(Y))

print("Y = ",sum(Y))


print("Solucion A = {} ".format(x[0]))
print("Solucion B = {} ".format(x[1]))




