# -*- coding: utf-8 -*-
"""
K-Nearest Neighbors Classifier Class Module
"""

import numpy as np

from auxiliary_functions import calculate_distances

class KNN:
    'Class that implements the K-nearest Neighbors Classifier'
    
    def __init__(self,k = 1):
        self.k = k
        
    def fit(self, X_train, y_train):
		# Work with columns pattern
        self.Cx = X_train.T
        self.Cy = y_train.T
        
    def predict(self, X_test):
	
		# Work with columns pattern
        X_test = X_test.T

        # Get samples and Hyperparameters
        Cx = self.Cx
        Cy = self.Cy
        K = self.k
        
        # Get mumber of samples and attributes
        p,N = X_test.shape
        Nc = len(np.unique(Cy))
        
        yh = np.zeros((N,1))
        
        for i in range(N):
            
            # Calculate and Order distances
            sample = X_test[:,i]
            Vdist = calculate_distances(Cx,sample)
            ordDistanceIndex = np.argsort(Vdist,axis=0)
            
           # Sum labels from nearest neighbors
            counter = np.zeros((Nc,1))
            for j in range(K):
                label = Cy[0,ordDistanceIndex[j,0]]
                label = int(label)
                counter[label-1] = counter[label-1] + 1
            
            # Class: Makority Voting
            yh[i] = np.argmax(counter) + 1

        return yh