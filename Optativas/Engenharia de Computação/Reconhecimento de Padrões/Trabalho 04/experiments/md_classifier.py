# -*- coding: utf-8 -*-
"""
Minimum Distance Classifier Class Module
"""

import numpy as np

from auxiliary_functions import calculate_distances

class MDC:
    'Class that implements the Minimum Distance Classifier'
    
    def __init__(self):
        pass
        
    def fit(self, X_train, y_train):
        
        # Work in columns pattern
        X_train = X_train.T
        y_train = y_train.T
        
        p,N = X_train.shape
        ytr = y_train.astype(int)
        Nc = len(np.unique(ytr))
        
        counter = np.zeros((Nc,1))
        Cx = np.zeros((p,Nc))
        
        for i in range(N):
            counter[ytr[0,i]-1] = counter[ytr[0,i]-1] + 1
            Cx[:,ytr[0,i]-1] = Cx[:,ytr[0,i]-1] + X_train[:,i]
            
        for i in range(Nc):
            Cx[:,i] = np.divide(Cx[:,i],counter[i])
        
        self.Cx = Cx
        self.Cy = np.arange(Nc) + 1
        
    def predict(self, X_test):
        
        # Work in columns pattern
        X_test = X_test.T
        
        p,N = X_test.shape
        
        Cx = self.Cx
        Cy = self.Cy
        
        # Nc = len(Cy)
        
        yh = np.zeros((N,1))
        for i in range(N):
            amostra = X_test[:,i]
            Vdist = calculate_distances(Cx,amostra)
            min_index = np.argmin(Vdist)
            yh[i] = Cy[min_index]
        
        return yh 