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
    rf = neuralnetworks.randForestClassifier(X_trainQ, Y_trainQ)
    mlp = neuralnetworks.mlpClassifier(X_trainQ, Y_trainQ)
    neuralnetworks.learningCurve(rf, X_trainQ, Y_trainQ)
    neuralnetworks.learningCurve(mlp, X_trainQ, Y_trainQ)
    neuralnetworks.ROC(rf, X_testQ, Y_testQ)
    neuralnetworks.ROC(mlp, X_testQ, Y_testQ)
    classifiedIncorrectQuality = np.sum(neuralnetworks.predictQuality(mlp, X_testQ, Y_testQ) &
                                        neuralnetworks.predictQuality(rf, X_testQ, Y_testQ))
    # Classification By Color:
    rf = neuralnetworks.randForestClassifier(X_trainC, Y_trainC)
    mlp = neuralnetworks.mlpClassifier(X_trainC, Y_trainC)
    neuralnetworks.learningCurve(rf, X_trainC, Y_trainC)
    neuralnetworks.learningCurve(mlp, X_trainC, Y_trainC)
    neuralnetworks.ROC(rf, X_testC, Y_testC)
    neuralnetworks.ROC(mlp, X_testC, Y_testC)
if __name__ == '__main__':
    main()

