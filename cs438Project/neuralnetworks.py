from sklearn.model_selection import learning_curve
import re
import csv
import numpy as np
def buildNetwork(filename):
    with open(filename, newline=' ') as csvfile:
        arr = np.loadtxt(csvfile, delimiter=',')
    print(arr)
