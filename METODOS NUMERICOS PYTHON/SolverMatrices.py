# -*- coding: utf-8 -*-
"""
Created on Mon Sep 28 07:32:41 2020

@author: JRGIQ
"""

import numpy as np

A = np.matrix([[10,3,0],[3,8,1],[0,1,10]])
b = np.matrix([[10.5],[-26],[9.5]])
x = (A**-1)*b

for i in range(len(A)):
    pass
    
    print("X{} = ".format(i) , " {} ".format(x[i]))





