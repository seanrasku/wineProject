# This is a sample Python script.
import neuralnetworks
# Press ⌃R to execute it or replace it with your code.
# Press Double ⇧ to search everywhere for classes, files, tool windows, actions, and settings.


def main():
    filename = "winequality.csv"
    X_train, Y_train, X_test, Y_test, X, Y = neuralnetworks.buildNetwork(filename)
    rf = neuralnetworks.randForestClassifier(X_train, Y_train)
    mlp = neuralnetworks.mlpClassifier(X_train, Y_train)
    # neuralnetworks.learningCurve(rf, X_train, Y_train)
    # neuralnetworks.learningCurve(mlc, X_train, Y_train)
    # neuralnetworks.ROC(rf, X_test, Y_test)
    # neuralnetworks.ROC(mlp, X_test, Y_test)

if __name__ == '__main__':
    main()

