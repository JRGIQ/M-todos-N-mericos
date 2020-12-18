# -*- coding: utf-8 -*-
"""
Created on Wed Mar 13 17:59:15 2019

@author: Jheison Rene Gutierrez Gomez, "JRIQ".
"""
import numpy as np
import matplotlib.pyplot as pt


class regresion_lineal():
    
    def puntos(self):
        self.datos=int(input("Ingrese el numero de datos n : "))
        
     
        self.vectorx=[]
        self.vectory=[]

   ### MODO MANUAL

        # self.vectorx=[Ingresar los datos acá de forma manual separados por comas]
        # self.vectory=[Ingresar los datos acá de forma manual separados por comas]
        

          ## MODULO PARA MODO AUTOMATICO

        for i in range(self.datos):
            self.x=float(input("Ingrese el dato para eje x : "))
            self.y=float(input("Ingrese el dato para eje y : "))
            self.vectorx.append(self.x)
            self.vectory.append(self.y)
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
        pt.plot(self.X,self.pendiente*self.X+self.intercepto,"b",linewidth=2,label="Ajuste de datos")
        pt.xlabel("V [m3]",fontsize=12)
        pt.ylabel("t / V [s/m3]",fontsize=12)
        pt.title("Filtrado con Pretorta[Arena] - Torta[Cal] [Modelo de Darcy]",fontsize=12)  
        
        pt.plot(self.X,self.Y,"wo",label="R^2=0.88")
        pt.plot(self.X,self.Y,"wo",label="m=1586761900")
#        pt.plot(self.X,self.Y,"wo")
        pt.plot(self.X,self.Y,"wo",label="b=556688.89")
        pt.plot(self.X,self.Y,"ko",label="Datos experimentales")
        
        pt.grid(True)
        leg=pt.legend(loc="best",ncol=1,mode="center", shadow=True)
        leg.get_frame().set_alpha(0.5)
        
    def coeficiente_regresion_R2(self):
        self.sigmax=np.sqrt(self.xcuadrado/self.datos-self.promx**2)
        self.sigmay=np.sqrt(self.ycuadrado/self.datos-self.promy**2)
        self.sigmaxy=self.sumaxy/self.datos-self.promx*self.promy
        self.R2=(self.sigmaxy/(self.sigmax*self.sigmay))**2
        print("---------------------------------------------------------------")
        print("El coeficiente de regresion lineal R^2 es : ",self.R2)
        print("---------------------------------------------------------------")
        
            

regresion=regresion_lineal()
regresion.puntos()
regresion.vector()
regresion.parametros_regresion()
regresion.coeficiente_regresion_R2()

    
