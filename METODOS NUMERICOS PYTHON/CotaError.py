# -*- coding: utf-8 -*-
"""
Created on Mon Sep 28 09:28:59 2020

@author: JRGIQ
"""
import math as mt
import numpy as np



### Cota Minimos cuadrados

b=2
a=-1
n=3

C=((2*(b-a)**(n+1))/(4**(n+1)*mt.factorial(n+1)))

print("Cota error", C)




x=1
fmax=(mt.cos(((mt.pi*x)/(5))))  ## derivada

print("f'n (x) = ", fmax)