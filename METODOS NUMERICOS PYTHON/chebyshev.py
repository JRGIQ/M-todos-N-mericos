# -*- coding: utf-8 -*-
"""
Created on Sun Sep 27 20:13:22 2020

@author: JRGIQ
"""

from numpy.polynomial import chebyshev

import numpy as np
grado=4
nodos=grado+1
a=-3
b=2
coeffs_cheb = [0] * nodos+ [1] # N de nodos de la serie
T11 = chebyshev.Chebyshev(coeffs_cheb, [a,b])
xp_ch = T11.roots()

print("tn = ", xp_ch)


x = xp_ch

fxi=((np.exp(x))/(x**2+15))


pol = np.polyfit(x,fxi,len(x)-1)  # coeficientes del polinomio

xx = np.linspace(min(x),max(x))
yy = np.polyval(pol,xx) 

print("Polinomio de newton (Nodos Chebyshev) X^n+X^n-1.....X^0 f(x)= " , pol)   ## primer coeficiente X[0] el de la potencia mayor






