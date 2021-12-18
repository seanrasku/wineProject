from sklearn.ensemble import RandomForestClassifier
from sklearn import metrics
from sklearn.metrics import roc_curve
from sklearn.metrics import roc_auc_score
from sklearn.neural_network import MLPClassifier
from sklearn.model_selection import learning_curve
from sklearn.model_selection import train_test_split
from sklearn.preprocessing import StandardScaler
import matplotlib.pyplot as plt
import numpy as np

def buildQuality(filename):
    with open(filename) as csvfile:
        first = csvfile.readline()
        arr = np.loadtxt(csvfile, delimiter=',')
    data = np.array(arr)
    labels = data[0, :]
    X = data[0:len(data), 0:-1]
    y = data[0:len(data), -1]
    sc = StandardScaler()
    y[y <= 5] = 0
    y[y > 5] = 1
    X_train, X_test, Y_train, Y_test = train_test_split(X, y, test_size=0.2, random_state=42)

    X_train = sc.fit_transform(X_train)
    X_test = sc.transform(X_test)
    return X_train, Y_train, X_test, Y_test

def buildColor(filename):
    with open(filename) as csvfile:
        first = csvfile.readline()
        arr = np.loadtxt(csvfile, delimiter=',')
    data = np.array(arr)
    labels = data[0, :]
    X = data[0:len(data), 0:-2]
    y = data[0:len(data), -2]
    np.append(X, data[0:len(data), -1])
    X_train, X_test, Y_train, Y_test = train_test_split(X, y, test_size=0.2, random_state=42)

    sc = StandardScaler()
    X_train = sc.fit_transform(X_train)
    X_test = sc.transform(X_test)
    return X_train, Y_train, X_test, Y_test

def randForestClassifier(X_train, Y_train):
    rf = RandomForestClassifier()
    rf.fit(X_train, Y_train)
    return rf

def mlpClassifier(X_train, Y_train):
    m = MLPClassifier(solver="adam", alpha=1, hidden_layer_sizes=(30,), random_state=1)
    m.fit(X_train, Y_train)
    return m

def ROC(alg, X_test, Y_test):
    y_pred = alg.predict(X_test)
    print("Accuracy: ", metrics.accuracy_score(Y_test, y_pred))
    prob_vect = alg.predict_proba(X_test)[:, 1]

    fpr, tpr, thresholds = roc_curve(Y_test, prob_vect)
    auc = roc_auc_score(Y_test, y_pred)
    plt.figure()
    plt.plot(fpr, tpr, label="AUC = %0.3f" % auc)
    plt.xlabel("False Positive Rate")
    plt.ylabel("True Positive Rate")
    plt.title("Receiver Operator Characteristic")
    plt.legend(loc="lower right")
    plt.savefig("ROC_CURVE")

def learningCurve(alg, X_train, Y_train):

    train_sizes, train_scores, test_scores = learning_curve(alg, X_train, Y_train)

    plt.subplots(1, figsize=(10, 10))
    plt.plot(train_sizes, np.mean(train_scores, axis=1), label="Training Score")
    plt.plot(train_sizes, np.mean(test_scores, axis=1), label="Cross-Validation Score")

    plt.xlabel("Training Example Size")
    plt.ylabel("Accuracy")
    plt.title("Learning Curve")
    plt.legend(loc="lower right")
    plt.savefig("LEARNING_CURVE")
