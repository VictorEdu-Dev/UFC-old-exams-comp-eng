import numpy as np
import math

# from sklearn.model_selection import train_test_split

# def random_subsampling(X, Y, train_size=0.8, seed=None):
#     return train_test_split(X, Y, train_size, random_state=seed)

# Return list of shuffled indices
def shuffle_indices(n,random_state):
    np.random.seed(random_state)
    return np.random.permutation(n)

# Uses a random percentage of data for training
def random_subsampling(X, Y, train_size=0.8, random_state=None):
    
	# Get number of samples
    n = X.shape[0]

    # Shuffle data
    shuffled_indices = shuffle_indices(n,random_state)
    X = X[shuffled_indices, :]
    Y = Y[shuffled_indices, :]

    # Get Number of samples for training
    n_tr = math.floor(n*train_size)
	
    # Hold samples for training and test
    Xtr = X[0:n_tr, :]
    Xts = X[n_tr:,  :]
    Ytr = Y[0:n_tr, :]
    Yts = Y[n_tr:,  :]

    return Xtr, Ytr, Xts, Yts

# Just one sample for test
def leave_one_out(X,Y,iteration):
    
    N,p = X.shape
	
    Xts = np.multiply(np.ones((1,p)),X[iteration,:])
    Yts = np.multiply(np.ones((1,1)),Y[iteration,:])
    
    if (iteration == 0):
        #display('First')
        Xtr = X[1:,:]
        Ytr = Y[1:,:]
    elif (iteration == N-1):
        #display('Last')
        Xtr = X[:,-1:]
        Ytr = Y[:,-1:]
    else:
        #display('Others')
        Xtr = np.concatenate((X[0:iteration,:],X[(iteration+1):,:]),axis=0)
        Ytr = np.concatenate((Y[0:iteration,:],Y[(iteration+1):,:]),axis=0)
    
    return Xtr, Ytr, Xts, Yts

# Divide data in k-folds
def k_fold(X,Y,Nfolds,fold):
    
    N = X.shape[0]
    NperFold = math.floor(N/Nfolds)
    
    if (fold == 0):
        #display('first fold')
        Xts = X[0:NperFold,:]
        Yts = Y[0:NperFold,:]
        Xtr = X[NperFold:,:]
        Ytr = Y[NperFold:,:]
    elif (fold == Nfolds-1):
        #display('last fold')
        Xts = X[NperFold*(Nfolds-1):,:]
        Yts = Y[NperFold*(Nfolds-1):,:]
        Xtr = X[0:NperFold*(Nfolds-1),:]
        Ytr = Y[0:NperFold*(Nfolds-1),:]
    else:
        #display('other folds')
        Xts = X[NperFold*fold:NperFold*(fold+1),:]
        Yts = Y[NperFold*fold:NperFold*(fold+1),:]
        Xtr = np.concatenate((X[0:NperFold*fold,:],X[NperFold*(fold+1):,:]),axis=0)
        Ytr = np.concatenate((Y[0:NperFold*fold,:],Y[NperFold*(fold+1):,:]),axis=0)
    
    return Xtr, Ytr, Xts, Yts