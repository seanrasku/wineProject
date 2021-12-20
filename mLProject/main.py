# This is a sample Python script.
import neuralnetworks
import numpy as np
# Press ⌃R to execute it or replace it with your code.
# Press Double ⇧ to search everywhere for classes, files, tool windows, actions, and settings.


def main():
    filename = "winequality.csv"
    X_trainQ, Y_trainQ, X_testQ, Y_testQ, XQ, yQ = neuralnetworks.buildQuality(filename)
    X_trainC, Y_trainC, X_testC, Y_testC, XC, yC = neuralnetworks.buildColor(filename)
    # Classification By Quality:
    rfQ = neuralnetworks.randForestClassifier(X_trainQ, Y_trainQ)
    mlpQ = neuralnetworks.mlpClassifier(X_trainQ, Y_trainQ)
    # neuralnetworks.learningCurve(rfQ, X_trainQ, Y_trainQ)
    # neuralnetworks.learningCurve(mlpQ, X_trainQ, Y_trainQ)
    # neuralnetworks.ROC(rfQ, X_testQ, Y_testQ)
    # neuralnetworks.ROC(mlpQ, X_testQ, Y_testQ)
    classifiedIncorrectQuality = np.sum(neuralnetworks.predictQuality(mlpQ, X_testQ, Y_testQ) &
                                        neuralnetworks.predictQuality(rfQ, X_testQ, Y_testQ))
    print("Classified incorrect for Quality: ", classifiedIncorrectQuality)

    # Classification By Color:
    rfC = neuralnetworks.randForestClassifier(X_trainC, Y_trainC)
    mlpC = neuralnetworks.mlpClassifier(X_trainC, Y_trainC)
    #neuralnetworks.learningCurve(rfC, X_trainC, Y_trainC)
    neuralnetworks.learningCurve(mlpC, X_trainC, Y_trainC)
    #neuralnetworks.ROC(rfC, X_testC, Y_testC)
    neuralnetworks.ROC(mlpC, X_testC, Y_testC)
    #classifiedIncorrectColor = np.sum(neuralnetworks.predictQuality(mlpC, X_testC, Y_testC) &
    #                                    neuralnetworks.predictQuality(rfC, X_testC, Y_testC))
    #print("Classified incorrect for Color: ", classifiedIncorrectColor)
if __name__ == '__main__':
    main()

