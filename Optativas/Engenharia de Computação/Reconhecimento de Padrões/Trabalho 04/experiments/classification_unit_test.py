# Import Libraries

import data_loader
import hold_out
import evaluation

from md_classifier import MDC
from knn_classifier import KNN
from dt_classifier import DTC

# # Experiment 1 - IRIS, MDC, Leave-one-out

# Load DataSet
X, Y = data_loader.load_iris()

# Shuffle its indices (for leave-one-out)
N, _ = X.shape
shuffled_indices = hold_out.shuffle_indices(n=N,random_state=None)
X = X[shuffled_indices, :]
Y = Y[shuffled_indices, :]

# Init Output
mean_acc_mdc = 0

for i in range(N):
    
    # Split data between train and test
    Xtr,Ytr,Xts,Yts = hold_out.leave_one_out(X,Y,i)
    
    # Build Model
    MDClassifier = MDC()
    MDClassifier.fit(Xtr,Ytr)
    
    # Predict outputs
    Yh = MDClassifier.predict(Xts)
    
    # Calculate and Accumulate accuracy
    acc_mdc = evaluation.calculate_accuracy(Yts,Yh)
    mean_acc_mdc = mean_acc_mdc + acc_mdc

# Mean Accuracy    
mean_acc_mdc = mean_acc_mdc/N

print('Mean Accuracy of MD Classifier, with Iris Dataset and Leave-one-out Method:')
print(mean_acc_mdc)

# # Experiment 2 - Wine, KNN, Random Subsampling

# Load DataSet
X, Y = data_loader.load_wine()

# Define number of realizations (for random subsampling)
Nrealizations = 10

# Init Output
mean_acc_knn = 0

for i in range(Nrealizations):
    
    # Split data between train and test
    Xtr,Ytr,Xts,Yts = hold_out.random_subsampling(X, Y, train_size=0.8,
                                                  random_state=None)
    
    # Build Model
    KNNClassifier = KNN(k = 1)
    KNNClassifier.fit(Xtr,Ytr)
    
    # Predict outputs
    Yh = KNNClassifier.predict(Xts)
    
    # Calculate and Accumulate accuracy
    acc_knn = evaluation.calculate_accuracy(Yts,Yh)
    mean_acc_knn = mean_acc_knn + acc_knn
    
mean_acc_knn = mean_acc_knn/Nrealizations

print('Mean Accuracy of KNN Classifier, with Wine Dataset and Random Subsampling Method:')
print(mean_acc_knn)

# # # Experiment 3 - Signals, Decision Tree, k-fold

# Load DataSet
X, Y = data_loader.load_ecg_audio()

# Shuffle its indices (for k-fold)
N, _ = X.shape
shuffled_indices = hold_out.shuffle_indices(n=N,random_state=None)
X = X[shuffled_indices, :]
Y = Y[shuffled_indices, :]

# Define number of folds (for k-fold)
Nfolds = 5

# Init Output
mean_acc_dt = 0

for fold in range(Nfolds):
    
    # Split data between train and test
    Xtr,Ytr,Xts,Yts = hold_out.k_fold(X,Y,Nfolds,fold)

    # Build Model
    DTClassifier = DTC()
    DTClassifier.fit(Xtr,Ytr)
    
    # Predict outputs
    Yh = DTClassifier.predict(Xts)
    
    # Calculate and Accumulate accuracy
    acc_dt = evaluation.calculate_accuracy(Yts,Yh)
    mean_acc_dt = mean_acc_dt + acc_dt
    
mean_acc_dt = mean_acc_dt/Nfolds

print('Mean Accuracy of DT Classifier, with Signals Dataset and k-fold Method:')
print(mean_acc_dt)