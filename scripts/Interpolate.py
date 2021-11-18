#!/usr/bin/env python
# coding: utf-8

# In[ ]:


import pandas as pd
import numpy as np
import matplotlib.pyplot as plt


# In[ ]:


def sigmX(varX,xponent):
    namX = sum( ((varX)**xponent) )        # Sigma(  (xk**i))
    return (namX)
# -----------------------------------------------------------------------------------------------------------------------
def sigmY(varX,varY,xponent): # Take the variables & return the special sum
    namY = sum( (varY)*((varX)**xponent) ) # Sigma(yk(xk**i))
    namX = sum( ((varX)**xponent) )        # Sigma(  (xk**i))
    return (namY)           # return Sigma(yk(xk**i)), Sigma((xk**i))
# -----------------------------------------------------------------------------------------------------------------------
def eval_equ(x,coef):
    ay = [] # create an empty
    l = (len(coef))-1 # len(coef) will return the desired exponent +1. so we -1 to compensate.
    for i in range(l+1): # but we want to use every coefficient so l+1 here.
        t = coef[i]*(x**(l-i)) # l-i. Goes down by one each iteration from the desired exponent created 2 lines above.
        ay.append(t)
    return sum(ay) # sum together to get the evaluation of x. 
 # -----------------------------------------------------------------------------------------------------------------------


# In[ ]:


def n_tur_pole8(x,y,n):
    A = pd.DataFrame()
    for i in range(n+1):
        Ai = []
        for j in range(n+1):
            Aij = sigmX(x,((2*(n))-j-i))
            Ai.append(Aij)
#            print(Ai)
        A[i] = Ai
    r = []
    for i in range(n+1):
        ri = sigmY(x,y,((n)-i))
        r.append(ri)
    r = np.array(r).reshape(-1,1)
    product = np.matmul(np.linalg.inv(A),r)
#    print(pd.DataFrame(A))
    return list(product)
# -----------------------------------------------------------------------------------------------------------------------
def get_adjusted(x,y,n):
    yhat = []
    residual_vector = []
    Totals_vector = []
    av_rage = y.mean()
    l = len(y)
    enter_polate = n_tur_pole8(x,y,n)
    p = len(enter_polate)
    for i in range(len(x)): # This makes yhat
        xx = eval_equ(x[i],enter_polate)
        yhat.append(xx) 
    for i in range(len(y)): # This makes residuals: sigma((y - yhat)**2)
        resi = (y[i] - yhat[i])**2
        residual_vector.append(resi)
    for i in range(len(y)): # This makes Sum of Square Totals: sigma((y - mu)**2)
        toti = (y[i] - av_rage)**2
        Totals_vector.append(toti)
        
    # This makes the adj-R**2 value
    SSE = sum(residual_vector)
    SST = sum(Totals_vector)
    SSR = SST - SSE
    R_Squ = 1 - (SSE/SST)
    adj_R_Squ =  1 - ( ( (SSE)/( (l) - (p) ) )/( (SST)/( (l) - (1) ) ) ) 
    return adj_R_Squ # ,(SSE/SST),SSE,SST


# In[ ]:


def drivative(coef):
    ret = []
    l = len(coef)
    for i in range(l-1):
        urn = (coef[i])*((l-1)-i)
        ret.append(urn)
    return ret
def sec_derivative(coef):
    coefprime = drivative(coef)
    return drivative(coefprime)


# In[ ]:





# In[ ]:





# In[ ]:





# In[ ]:




