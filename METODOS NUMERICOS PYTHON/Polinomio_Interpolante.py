# -*- coding: utf-8 -*-
"""
Created on Thu Jun 27 23:44:54 2019

@author: Jheison Rene Gutierrez Gomez
"""
import numpy as np
import matplotlib.pyplot as pt
from sympy import Symbol
from sympy import integrate

class polinomio():
    
    def puntos(self):
#        self.datos=int(input("Ingrese el numero de datos n : "))
        self.vectorx=np.array([0,1,2,3,4,5,6,7,8])
        self.vectory=np.array([1,1.39,1.93,2.66,3.7,7.12,13.7,14,15])

          ### MODULO PARA MODO AUTOMATICO

#        for i in range(self.datos):
#            self.x=float(input("Ingrese el dato para eje x : "))
#            self.y=float(input("Ingrese el dato para eje y : "))
#            self.vectorx.append(self.x)
#            self.vectory.append(self.y)
#            
    def vector(self):
        self.X=np.array(self.vectorx)
        self.Y=np.array(self.vectory)
        print("-____________________________________________________")
        print("Los puntos ingresados en X son : ",np.vstack(self.X))
        print("---------------------------------------------------------------")
        print("Los puntos ingresados en Y son :",np.vstack(self.Y))
        print("-____________________________________________________")
        
    def polinomio(self):
        
        self.coeficientes=np.polyfit(self.X,self.Y,4)
        self.polinomio=np.poly1d(self.coeficientes)
        print("El polinomio interpolante es Y=",self.polinomio)
        print("----------------------------------------------------------------") 
        
        self.X_inicial=min(self.vectorx)
        self.X_final=max(self.vectorx)
        
        self.eval_polinomio=np.linspace(self.X_inicial,self.X_final)
        self.xi0=0
        self.vector=[]
        self.eval_polinomio=np.ones(self.X_final)
        
        for i in range(len(self.eval_polinomio)):
            
            self.eval_polinomio[i]=3.697e-12 *self.xi0**4 - 3.485e-09 *self.xi0 **3+ 1.343e-06 *self.xi0**2 - 0.0002978 *self.xi0 + 0.04999
            
            self.xi=self.xi0+1
            self.xi0=self.xi
            self.vector.append(self.xi0)
            
        pt.figure(1,figsize=(9,5))
        pt.subplot(1,2,1)
        pt.plot(self.vector,self.eval_polinomio)
        pt.plot(self.vectorx,self.vectory,"ko")
        pt.xlabel("Eje X")
        pt.ylabel("Eje Y")
        pt.title("Ajuste de polinomio")
        pt.grid(True)
        
    def derivada(self):
        x=Symbol('x')
        self.polinomio1=3.697e-12 *x**4 - 3.485e-09 *x **3+ 1.343e-06 *x**2 - 0.0002978 *x + 0.04999
        self.derivada_polinomio=self.polinomio1.diff(x)
        print("La derivada del polinomio interpolante es :",self.derivada_polinomio)
        print("-____________________________________________________")
        
        
        
    def grafica_derivada(self):
        
        
        self.X_final=max(self.vectorx)
        
        self.eval_derivada=np.linspace(self.X_inicial,self.X_final)
        self.xi0=0
        self.vector=[]
        self.eval_derivada=np.ones(self.X_final)
        
        for i in range(len(self.eval_derivada)):
            
            self.eval_derivada[i]=1.4788e-11*self.xi0**3 - 1.0455e-8*self.xi0**2 + 2.686e-6*self.xi0 - 0.0002978
            
            self.xi=self.xi0+1
            self.xi0=self.xi
            self.vector.append(self.xi0)
            
        pt.subplot(1,2,2)
        pt.plot(self.vector,-self.eval_derivada)
        pt.xlabel("Eje X")
        pt.ylabel("Eje Y")
        pt.title("Grafica de la derivada")
        pt.grid(True)
        pt.grid(True)
        pt.show()
        
    def valor_puntos(self):
        
        self.nodos=np.linspace(self.X_inicial,self.X_final,10)
        self.xi1=0
        self.eval_polinomio_evaluado_1punto=np.ones(len(self.nodos))
        self.eval_derivada_evaluada_1punto=np.ones(len(self.nodos))
        
        
        
        for i in range(len(self.nodos)):
               
            self.eval_polinomio_evaluado_1punto[i]=3.697e-12 *self.xi1**4 - 3.485e-09 *self.xi1 **3+ 1.343e-06 *self.xi1**2 - 0.0002978 *self.xi1 + 0.04999
            self.eval_derivada_evaluada_1punto[i]=1.4788e-11*self.xi1**3 - 1.0455e-8*self.xi1**2 + 2.686e-6*self.xi1 - 0.0002978
            self.Xi1=self.xi1+1
            self.xi1=self.Xi1
        
        print("los puntos del polinomio son : ",np.vstack(self.eval_polinomio_evaluado_1punto))
        print("Los puntos de la derivada son : ",np.vstack(-self.eval_derivada_evaluada_1punto))
        
        
        
datos=polinomio()
datos.puntos()
datos.vector()
datos.polinomio()
datos.derivada()
datos.grafica_derivada()
datos.valor_puntos()
        
        
        
        
        
        
        
        
        