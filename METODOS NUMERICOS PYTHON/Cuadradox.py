# -*- coding: utf-8 -*-
"""
Created on Sun Sep 27 22:55:21 2020

@author: JRGIQ
"""

import pandas as pd
import statsmodels.formula.api as sm

df = pd.DataFrame({"A": [10,20,30,40,50], "B": [20, 30, 10, 40, 50], "C": [8,14,15,8]})
result = sm.ols(formula="A ~ B +C ", data=df).fit()
print (result.params)

print (result.summary())