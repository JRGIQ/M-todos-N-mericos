# -*- coding: utf-8 -*-
"""
Created on Tue Jun 18 22:08:27 2019

@author: jheis
"""

import math as mt
import matplotlib.pyplot as pt
import numpy as np

######################### METODO EULER

Cao=0.112
Cbo=0.132
Cxo=0.0783
Cyo=0.0786
k1=0.0001
k2=0.0015
k3=0.008
N=100

vo=0
vf=300
x=0
h=((vf-vo)/(N))
vectorCa=[Cao]
vectorv=[vo]
vectorCb=[Cbo]
vectorCx=[Cxo]
vectorCy=[Cyo]

for i in range(N):
    
    dCa=(-k1)-(k2*Cao*(1-x))-(k3*(1-x)**2)*(Cao**2)
    dCb=k2*Cao
    dCx=k1
    dCy=k3*Cao**2
    
    Cb=Cbo+h*dCb
    Ca=Cao+h*dCa
    Cx=Cxo+h*dCx
    Cy=Cyo+h*dCy
    
    v=i*h
    Cao=Ca
    Cbo=Cb
    Cxo=Cx
    Cyo=Cy
    
    
    vectorv.append(v)
    vectorCa.append(Ca)
    vectorCb.append(Cb)
    vectorCx.append(Cx)
    vectorCy.append(Cy)
    
    
pt.figure(1,figsize=(8,5))   
pt.plot(vectorv,vectorCa,"k--",label="Ca")
pt.plot(vectorv,vectorCb,"b--",label="Cb")
pt.plot(vectorv,vectorCx,"g-",label="Cx")
pt.plot(vectorv,vectorCy,"r--",label="Cy")


pt.xlabel("Tiempo espacial [s]",fontsize=15)
pt.ylabel("Concentracion [mol/L]",fontsize=15)
pt.title("Perfil de Concentraciones (PFR)",fontsize=20)
pt.grid(True)    
leg=pt.legend(loc="best",shadow=True)
leg.get_frame().set_alpha(0.5)

####################### METODO RK4

#k1=0.0001
#k2=0.0015
#k3=0.008
#v=3
#tao=0
#taof=300
#Ca0=0.112
#Cbo=0.132
#Cxo=0.0783
#Cyo=0.0786
#
#x=0
#N=100
#ConcentracionA=[Ca0]
#ConcentracionB=[Cbo]
#TAO=[0]
#h=((taof-tao)/(N))
#
#for i in range(N):
#    
#    K1=(-k1)-(k2*Ca0*(1-x))-(k3*Ca0**2*(1-x)**2)
#    
#    
#    Ca0K2=Ca0*(1-x)+(0.5*K1*h)
#    K2=(-k1)-(k2*Ca0K2*(1-x))-(k3*Ca0K2**2*(1-x)**2)
#    
#    Ca0K3=Ca0*(1-x)+(0.5*K2*h)
#    K3=(-k1)-(k2*Ca0K3*(1-x))-(k3*Ca0K3**2*(1-x)**2)
#    
#    Ca0K4=Ca0*(1-x)+K3*h
#    K4=(-k1)-(k2*Ca0K4*(1-x))-(k3*Ca0K4**2*(1-x)**2)
#    
#    
##    dCa=(-k1)-(k2*Ca0*(1-x))-(k3*Ca0**2*(1-x)**2)
##    
#    
#    CA=Ca0*(1-x)+((h/6)*(K1+2*K2+2*K3+K4)) ######metodo
#    Ca0=CA
#    
#    
#    Tao=tao+h
#    tao=Tao
#    
#    ConcentracionA.append(Ca0)
#    TAO.append(Tao)
#    
#    
#    pt.xlabel("Tao [V/vo]")
#    pt.ylabel("Concentracion [mol/L]")
#    pt.title("Concentracion a travez del PFR")
#    pt.grid(True)    
#pt.plot(TAO,ConcentracionA,"k--",label="Ca")
#leg=pt.legend(loc="best",shadow=True)
#leg.get_frame().set_alpha(0.5)
    
    