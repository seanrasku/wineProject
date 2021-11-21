# This is a sample Python script.
import numpy as np;

# Press ⌃R to execute it or replace it with your code.
# Press Double ⇧ to search everywhere for classes, files, tool windows, actions, and settings.


def main():
    f1 = open('winequality-red.txt', 'r')
    f2 = open('winequality-white.txt', 'r')
    first1 = f1.readline()
    first2 = f2.readline()

    lines1 = f1.readlines()
    lines2 = f2.readlines()
    featuresRed = np.empty((0, 12), float)
    featuresWhite = np.empty((0, 12), float)
    for line in lines1:
        temp = line.split(';')
        featuresRed = np.append(featuresRed, [temp], axis=0)
    for line in lines2:
        temp = line.split(';')
        featuresWhite = np.append(featuresWhite, [temp], axis=0)




# Press the green button in the gutter to run the script.
if __name__ == '__main__':
    main()

# See PyCharm help at https://www.jetbrains.com/help/pycharm/
