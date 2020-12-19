# -*- coding: utf-8 -*-
"""
Created on Sun Sep 27 20:16:51 2020

@author: JRGIQ
"""


import numpy as np
import matplotlib.pyplot as plt


x = np.array([-2 , -1.5 ,-1,  -0.5,  0,   0.5,  1  , 1.5 , 2 ])
fxi= np.array([-1/23 ,-2/25 ,-1/5,-2,1, 2/5,1/7,2/29,1/25])
pol = np.polyfit(x,fxi,len(x)-1)  # coeficientes del polinomio

xx = np.linspace(min(x),max(x))
yy = np.polyval(pol,xx) 

print("Polinomio de newton X^n+X^n-1.....X^0 f(x)= " , pol)   ## primer coeficiente X[0] el de la potencia mayor

