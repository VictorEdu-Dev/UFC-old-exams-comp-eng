# -*- coding: utf-8 -*-
"""
Data Functions Module

"""

import os                    # Get files' paths
import numpy as np           # Work with matrices (arrays)
import pandas as pd          # Load csv files
import scipy.stats as ss     # interquartile attribute

def load_ecg_audio():
    
    # Absolute Path
    audioFile_path = os.path.realpath('datasets/audio.txt')
    ecgFile_path = os.path.realpath('datasets/ecg.txt')

    # Get files as dataframes
    audio = pd.read_fwf(audioFile_path, header=None)
    ecg = pd.read_fwf(ecgFile_path, header=None)

    # 100 signals of 500 samples
    signals = pd.concat([audio.T,ecg.T])
    
    # Calculate Attributes
    minimum = signals.min(axis = 1) 
    maximum = signals.max(axis = 1)
    med = signals.mean(axis = 1)
    var = signals.var(axis = 1)
    std = signals.std(axis = 1)
    ske = signals.skew(axis = 1)
    kur = signals.kurtosis(axis = 1)
    iqr = signals.apply(lambda x: ss.iqr(x), axis=1)
    
    # Attributes and label Matrices
    X = np.array([minimum,maximum,med,var,std,ske,kur,iqr])
    Y = np.concatenate( (np.ones((1,50)),2*np.ones((1,50))) , axis=1 )
    
    return X.T,Y.T

def load_iris():
    
    # Absolute Path
    iris_path = os.path.realpath('datasets/iris.data.csv')
    df = pd.read_csv(iris_path) # load data in a dataframe
    
    # Attributes
    X = np.array(df.drop('classe',1)).T
    
    # Classes
    aux = pd.get_dummies(df['classe'])
    Y = np.array(aux.values)
    Y = np.argmax(Y,axis = 1) + 1
    N = len(Y)
    Y = np.multiply(np.ones((1,N)),Y)
    
    return X.T,Y.T
    
def load_wine():
    
    # Absolute Path
    wine_path = os.path.realpath('datasets/wine.csv')
    df = pd.read_csv(wine_path,header=None) # load data in a dataframe
    
    X = np.array(df.drop(df.columns[0], axis=1)).T
    Y = np.array(df.iloc[:,0]).T
    N = len(Y)
    Y = np.multiply(np.ones((1,N)),Y)
    
    return X.T,Y.T
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    