# -*- coding: utf-8 -*-
"""
Auxiliary Functions for Classifiers
"""

# Import Libraries

import os

import numpy as np
import pandas as pd
import scipy.stats as ss

import math
# import random
# import statistics

# from collections import Counter
# from sklearn.preprocessing import MinMaxScaler
# from sklearn.model_selection import train_test_split

def calculate_distances(matrix, sample):
    
    N = matrix.shape[1]
    
    distance_vector = np.zeros((N,1))
    for i in range(N):
        distance_vector[i] = np.sqrt(np.sum(np.square(matrix[:,i] - sample)))

    return distance_vector
    
def calcula_entropia(labels):

    Nsamples = len(labels)
    Nclasses = max(labels)
    Nclasses = int(Nclasses)
    
    counter = np.zeros((Nclasses,1))
    for i in range(Nsamples):
        label = int(labels[i])
        counter[label-1] = counter[label-1] + 1
    
    elements_freq_list = list()
    for i in range(Nclasses):
        elements_freq_list.append(counter[i])
        
    H = 0
    for i in range(Nclasses):
        prob = elements_freq_list[i]/Nsamples
        if (prob != 0):
            Hi = -(prob)*math.log(prob,2)
            H = H + Hi
    
    return H

def entropia_subBases(base1,base2):
    
    N1 = len(base1)
    N2 = len(base2)
    
    entropia1 = calcula_entropia(base1)
    entropia2 = calcula_entropia(base2)
    entropia_media = (N1/(N1+N2))*entropia1 + (N2/(N1+N2))*entropia2
    
    return entropia_media

def select_limiar(labels,values):
    
    Nsamples = len(labels)
    
    # Encontra Limiares
    limiares = list()
    lbl_ant = labels[0]
    for i in range(Nsamples-1):
        
        lbl = labels[i+1]
        if(lbl != lbl_ant):
            limiares.append((values[i+1]+values[i])/2)
        lbl_ant = lbl
    
    # Encontra limiar otimo
    entropia_limiar_otimo = math.inf
    Nlimiares = len(limiares)
    for i in range(Nlimiares):
        
        limiar = limiares[i]
        
        base1 = list()
        base2 = list()
        for j in range(Nsamples):
            if (values[j] <= limiar):
                base1.append(labels[j])
            else:
                base2.append(labels[j])
        
        # ToDo - Verify if any base is empty!
        
        mean_entropy = entropia_subBases(base1,base2)
        
        if(mean_entropy < entropia_limiar_otimo):
            limiar_otimo = limiar
            entropia_limiar_otimo = mean_entropy
    
    return limiar_otimo, entropia_limiar_otimo