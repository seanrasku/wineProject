# wineProject
Machine Learning Fall 2021 Semester Final Project - Wine Classification Problem\
Commit by Sean 12/13/2021: 
1. For loop in learningCurve.m only goes to 30 for testing purposes
2. bug fixed line 33, cost1 was plugged directly into plot rather than getting the end of cost1 and adding it as the cost for each iteration (this process was taken from gradientDescent, which does something similar)
3. plotLearningCurve added to plot curve, curve plots weird so needs to be looked at
4. Lastly, one odd thing that happens is when cost1 = [cost1; J(...)] is changed to cost1 = [cost 1 J(...)], the costs change, and they change when you do the same thing to trainCost, cost2, and testCost. This shouldn't happen, as it's only changing the dimension, and the end function gets the end value no matter whether it's a row or column vector


Commit by Sean 12/15/21:\
Added in new Python code with learning curve and ROC curve for Random Forest and MLP Classifiers
