import numpy as np
import math
def g(x):
    allVals = np.empty((0, 12), float)
    for i in range(len(x)):
        j = x[i]
        exponents = [1/(1 + math.pow(math.e, val)) for val in j]
        allVals = np.append(allVals, [exponents], axis=0)
        print(exponents)

    return allVals