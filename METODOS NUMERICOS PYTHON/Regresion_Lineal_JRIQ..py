# -*- coding: utf-8 -*-
"""
Created on Fri Jun 14 11:03:24 2019

@author: Jheison Rene Gutierrez Gomez, JRIQ.(2019)
"""

import numpy as np
import matplotlib.pyplot as pt


class regresion_lineal():
    
    def puntos(self):
        self.datos=int(input("Ingrese el numero de datos n : "))
        self.vectorx=[0.1,0.1,0.1,0.01,0.01,0.01,0.001,0.001,0.001]
        self.vectory=[1.667,1.477,1.605,0.292,0.273,0.270,0.097,0.023,0.021]

          #### MODULO PARA MODO AUTOMATICO

#        for i in range(self.datos):
#            self.x=float(input("Ingrese el dato para eje x : "))
#            self.y=float(input("Ingrese el dato para eje y : "))
#            self.vectorx.append(self.x)
#            self.vectory.append(self.y)
#            
    def vector(self):
        self.X=np.array(self.vectorx)
        self.Y=np.array(self.vectory)
        print("---------------------------------------------------------------")
        print("Los puntos ingresados son ejex-ejey respect/ : ",self.X,self.Y)
        
    def parametros_regresion(self):
        self.sumax=sum(self.X)
        self.sumay=sum(self.Y)
        self.xcuadrado=sum(self.X**2)
        self.ycuadrado=sum(self.Y**2)
        self.sumaxy=sum(self.X*self.Y)
        self.promx=sum(((self.X)/(self.datos)))
        self.promy=sum(((self.Y)/(self.datos)))
        self.pendiente=(self.sumax*self.sumay-self.datos*self.sumaxy)/(self.sumax**2-self.datos*self.xcuadrado)
        self.intercepto=self.promy-self.pendiente*self.promx
        print("---------------------------------------------------------------")
        print("La pendiente de la recta que se ajusta a los datos es : ",self.pendiente)
        print("---------------------------------------------------------------")
        print("El intercepto de la recta que se ajusta a los datos es : ",self.intercepto)
        
        pt.figure(1,figsize=(7,5))
        pt.plot(self.X,self.pendiente*self.X+self.intercepto,label="Ajuste con regresion lineal")
        pt.xlabel("Concentracion")
        pt.ylabel(" Absorbancia")
        pt.title("Regresion de Datos")       
        pt.plot(self.X,self.Y,"wo",label="Coef variacion R²=0.9911")
        pt.plot(self.X,self.Y,"wo",label="La pendiente (b) es:15.1021")
        pt.plot(self.X,self.Y,"wo",label="El intercepto (a) es a:0.0763")
        pt.plot(self.X,self.Y,"ro",label="Datos experimentales")
        pt.grid(True)
        leg=pt.legend(loc="upper left",ncol=1,mode="center", shadow=True)
        leg.get_frame().set_alpha(0.5)
        
    def coeficiente_regresion_R2(self):
        self.sigmax=np.sqrt(self.xcuadrado/self.datos-self.promx**2)
        self.sigmay=np.sqrt(self.ycuadrado/self.datos-self.promy**2)
        self.sigmaxy=self.sumaxy/self.datos-self.promx*self.promy
        self.R2=(self.sigmaxy/(self.sigmax*self.sigmay))**2
        print("---------------------------------------------------------------")
        print("El coeficiente de regresion lineal R² es : ",self.R2)
        print("---------------------------------------------------------------")
          
            

regresion=regresion_lineal()
regresion.puntos()
regresion.vector()
regresion.parametros_regresion()
regresion.coeficiente_regresion_R2()

