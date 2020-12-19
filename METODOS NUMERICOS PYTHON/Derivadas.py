# -*- coding: utf-8 -*-
"""
Created on Mon Sep 28 09:28:04 2020

@author: JRGIQ
"""

### defivadas 

from sympy import Symbol
from sympy import diff
from sympy import sin,cos


x=Symbol('x')
y=diff(x**5,x,2)
print(y)