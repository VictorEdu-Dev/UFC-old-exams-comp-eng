# -*- coding: utf-8 -*-
"""
Decision Tree Classifier Class Module
"""

import numpy as np
import math

from auxiliary_functions import select_limiar

class NODE:
    'Class that implements the node structure for a Decision Tree'
    
    def __init__(self, depth=0, minSamplesNode=5, minPercentage=0.8, maxDepth=6):
        
        self.minSamplesNode = minSamplesNode
        self.minPercentage = minPercentage
        self.maxDepth = maxDepth
        
        self.depth = depth
        self.data_indexes = list()
        self.sonList = list()
        self.attribute = 0
        self.threshold = 0
        self.is_leaf = 0
        self.label = 0
        
    def verify_set_leaf(self,labels):
        
        node_lbls = labels[0,self.data_indexes[:]]
        
        N = len(node_lbls)
        Nc = int(np.amax(node_lbls))

        counter = np.zeros((Nc,1))
        for i in range(N):
            node_lbl = int(node_lbls[i])
            counter[node_lbl-1] = counter[node_lbl-1] + 1
        
        percentage = np.divide(counter,N)
        
        max_percentage_index = np.argmax(percentage)
        
        # Less than "minSamplesNode": Get most common label for the node
        if (N <= self.minSamplesNode):
            self.is_leaf = 1
            self.label = np.argmax(counter) + 1
        # Any label with more than "minPercentage": get label
        elif(percentage[max_percentage_index] >= self.minPercentage):
            self.is_leaf = 1
            self.label = np.argmax(counter) + 1
        # Reached maximum depth: Get most common label for the node
        elif(self.depth >= self.maxDepth):
            self.is_leaf = 1
            self.label = np.argmax(counter) + 1
        # It is not a leaf!
        else:
            self.is_leaf = 0
            self.label = 0

class DTC:
    'Class that implements the Decision Tree Classifier'
    
    def __init__(self,attributes = list()):
        self.node_list = list()
        # Used for the Random Forest Classifier
        self.attributes = attributes
        
    def fit(self, X_train, y_train):
        
        # Work in columns pattern
        X_train = X_train.T
        y_train = y_train.T 
		
        # Get mumber of samples and attributes
        p,N = X_train.shape
        
        # Init root node and add it to tree (always at position 0)
        rootNode = NODE()
        rootNode.data_indexes = np.arange(start=0, stop=N, step=1).tolist()
        self.node_list.append(rootNode)
        
        # Bild Tree (Add other nodes to root)
        while True:
            
            while_break_condition = 1
            
            number_of_nodes = len(self.node_list)
            
            for i in range(number_of_nodes):
                
                node = self.node_list[i]
                
                number_of_sons = len(node.sonList)
                
                # If it is not a leaf and dont have sons, expand node
                if( (node.is_leaf == 0) and (number_of_sons == 0) ):
                    
                    # Continue until there are no nodes to expand
                    while_break_condition = 0
                    
                    # Get node labels and samples
                    node_lbls = y_train[0,node.data_indexes]
                    node_samples = X_train[:,node.data_indexes]
                    
                    # ToDo - Calculate Information Gain
                    # node_lbls_entropy = calcula_entropia(node_lbls)
                    
                    # Find the best attribute and bias
                    optimum_entropy = math.inf
                    for attribute in range(p):
                        
                        # Get attribute values from each sample
                        attributes_values = node_samples[attribute,:]
                        # Order list of values and labels
                        orderedValuesIndex = np.argsort(attributes_values,axis=0)
                        node_lbl_ord = node_lbls[orderedValuesIndex]
                        node_val_ord = attributes_values[orderedValuesIndex]
                        # Select Best bias for this attribute
                        bias, bias_entropy = select_limiar(node_lbl_ord,node_val_ord)
                        # Define optimum attribute and bias
                        if(bias_entropy < optimum_entropy):
                            optimum_bias = bias
                            optimum_entropy = bias_entropy
                            optimum_attribute = attribute
                    
                    # Update father node 
                    node.attribute = optimum_attribute
                    node.threshold = optimum_bias
                    node.sonList.append(number_of_nodes)
                    node.sonList.append(number_of_nodes+1)
                    
                    # Define indexes of each son node
                    data_indexes_son1 = list()
                    data_indexes_son2 = list()
                    Nsamples = len(node_lbls)
                    for sample in range(Nsamples):
                        if (node_samples[optimum_attribute,sample] <= optimum_bias):
                            data_indexes_son1.append(sample)
                        else:
                            data_indexes_son2.append(sample)

                    # Build node son 1
                    node1 = NODE()
                    node1.depth = node.depth + 1
                    node1.data_indexes = data_indexes_son1
                    node1.verify_set_leaf(y_train)

                    self.node_list.append(node1)

                    # Build node son 2
                    node2 = NODE()
                    node2.depth = node.depth + 1
                    node2.data_indexes = data_indexes_son2
                    node2.verify_set_leaf(y_train)

                    self.node_list.append(node2)
                
                    # Restart Search (leave "for loop")
                    break                    
            
            if(while_break_condition == 1):
                break
       
    def predict(self, X_test):
        
        # Work in columns pattern
        X_test = X_test.T
		
        # Get mumber of samples and attributes
        p,N = X_test.shape
        
        # Init output
        yh = np.zeros((N,1))
        
        for i in range(N):
            
            # Get sample
            sample = X_test[:,i]
            
            # Get root node
            node = self.node_list[0]
            
            while True:
                
                if(node.is_leaf == 1):
                    yh[i] = node.label
                    break
                else:
                    attribute = node.attribute
                    bias = node.threshold
                    if(sample[attribute] <= bias):
                        son_index = node.sonList[0]
                        node = self.node_list[son_index]
                    else:
                        son_index = node.sonList[1]
                        node = self.node_list[son_index]                
            
        return yh