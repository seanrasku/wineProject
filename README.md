# wineProject
Machine Learning Fall 2021 Semester Final Project - Wine Classification Problem
Newest commit by Sean (12/13/2021): 
1. For loop in learningCurve.m only goes to 30 for testing purposes
2. bug fixed line 33, cost1 was plugged directly into plot rather than getting the end of cost1 and adding it as the cost for each iteration (this process was taken from gradientDescent, which does something similar)
3. plotLearningCurve added to plot curve, curve plots weird so needs to be looked at
4. Lastly, one odd thing that happens is when cost1 = [cost1; J(...)] is changed to cost1 = [cost 1 J(...)], the costs change, and they change when you do the same thing to trainCost, cost2, and testCost. This shouldn't happen, as it's only changing the dimension, and the end function gets the end value no matter whether it's a row or column vector


Commit Sean (12/17/21)
1. ROC Curves look much better
2. Classify by color done
3. Learning Curves improved as well, but still need parameter tuning (Paul)
4. Convergence warning keeps popping up, but @ignore_warnings should take care of that
