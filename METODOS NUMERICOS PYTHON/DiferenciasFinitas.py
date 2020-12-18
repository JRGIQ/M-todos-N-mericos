# -*- coding: utf-8 -*-
"""
Created on Fri Oct 30 01:25:17 2020

@author: JRGIQ
"""

import numpy as np


        
        
U_norte=100#float(input("Ingresar condición inicial superior = "))
U_sur=0#float(input("Ingresar condición inicial inferior = "))
U_ort=50#float(input("Ingresar condición inicial derecha = "))
U_oct=75#float(input("Ingresar condición inicial izquierda = "))


NodosX,NodosY=20,20
matriz=np.zeros((NodosX,NodosY))
malla=np.zeros((NodosX,NodosY))
error=np.zeros((NodosX,NodosY))



for m in range(0,NodosX-1):
    

    for n in range(0,NodosY):
        
                        
        
    
        malla[0,n]=(U_norte+U_oct+U_ort)/3
        malla[m+1,n]=(U_oct+U_ort)/2
        malla[NodosX-1,n]=(U_ort+U_oct+U_sur)/3 
        
        
        
for k in range(0,NodosX):
    
            
    for l in range(0,NodosY):
        
                
        # error[k,l]=(matriz[k,l]-malla[k,l]) 
        # ERR=abs(sum(sum(error)))
        n=1
        max=100
                
                
        while  n<=max:
                    

                    
                #     print("iterando")
                
                    
                    
                    for i in range(0,NodosX-2):
                            
            
                        for j in range(0,NodosY-2):
                            
                                
        
        
            
                            matriz[0,0]=(malla[1,0]+U_norte+malla[0,1]+U_oct)/4
                                
                                   
                            matriz[0,j+1]=(malla[1,j+1]+U_norte+malla[0,j+1]+matriz[0,j])/4
                                    
                            matriz[0,NodosY-1]=(matriz[0,NodosY-2]+U_norte+U_ort+malla[1,NodosY-1])/4
                    
                            
                                
                                
                                    
                            matriz[i+1,0]=(matriz[i,0]+malla[i+2,0]+malla[i+1,1]+U_oct)/4
                            matriz[i+1,j+1]=(malla[i+2,j+1]+matriz[i,j+1]+malla[i+1,j+2]+matriz[i+1,j])/4
                            matriz[i+1,NodosY-1]=(malla[i+2,NodosY-2]+matriz[i,NodosY-1]+U_ort+matriz[i+1,NodosY-2])/4
                                    
                                
                            
                    
                            matriz[NodosX-1,0]=(U_sur+matriz[NodosX-2,0]+malla[NodosX-1,1]+U_oct)/4
                            matriz[NodosX-1,j+1]=(U_sur+matriz[NodosX-2,j+1]+malla[NodosX-1,j+2]+matriz[NodosX-1,j])/4
                            matriz[NodosX-1,NodosY-1]=(U_sur+matriz[NodosX-2,NodosY-1]+U_ort+matriz[NodosX-1,NodosY-2])/4
                       
                            error[k,l]=(malla[k,l]-matriz[k,l])
                            
                            ERR=abs(sum(sum(error))) 
                            n=n+1
                            malla[k,l]=matriz[k,l]
                            
                            
                    if ERR<=1e-3:
                        
                        
                        
                        break                                            
                                
                                
                            

                
        

print("iteraciones",n-1)


np.set_printoptions(precision=2,suppress=True)
print(matriz) 
# print(malla)

print(ERR)
# print(len(malla))
        

 



    