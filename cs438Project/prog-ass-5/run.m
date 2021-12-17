clear; close all; clc
% Programming exercise 5

[X, y] = loadData('../winequality.csv');

% Randomly select 100 data points to display
sel = randperm(size(X, 1));

% displayData(X(sel(1:100), :), "sample data");

split = round(length(y) * 0.8);

% Select a random 80% as the training set and 20% as the test set

X_test = X(sel(split+1:end), :);
X = X(sel(1:split), :);
y_test = y(sel(split+1:end));
y = y(sel(1:split));

% Do the training on the training set

m = rows(X);
n1 = columns(X);

n = [n1, 30, 30, max(y)];

Y = prepareY(y);
Theta = initTheta(n);

lambda = 1;
alpha = 2;
maxIter = 500;

% printf('\nHere are some samples from the training dataset.\nPress enter to start training.');
pause;

[Theta, costs] = gradientDescent(Theta, X, Y, lambda, alpha, maxIter);

plotCost(costs);

% Print training and test accuracy
forwardPropagate(Theta, X);
dbstop in run.m if error
est = forwardPropagate(Theta, X){end};


[_, pred] = max(est);
pred = pred';
correct = sum(pred == y);
accuracy = correct / rows(y);
printf("Training accuracy = %f\n", accuracy);
est_test = forwardPropagate(Theta, X_test){end};
[_, pred] = max(est_test);
pred = pred';
correct = sum(pred == y_test);
accuracy = correct / rows(y_test);
printf("Test accuracy = %f\n", accuracy);

printf('\nPress enter to see misclassified digits of the test set.');
pause;

wrongs = pred != y_test;

% If you enable the below if clause, it will show each misclassified digit individually.
% It will also display the details of the misclassification such as "7 --> 9" meaning
% it is a 7 but misclassified as a 9. Keep pressing enter to progress.
if (0)
	for i=1:length(wrongs)
		if (wrongs(i) == 1)
			close all;
			displayData(X_test(i,:), sprintf("%d --> %d", y_test(i), pred(i)));
			printf("\nActual: %d Predicted: %d. Press enter to continue.", y_test(i), pred(i))
			pause;
		end
	end
end

sel = randperm(size(X_test(wrongs,:), 1));
sel = sel(1:(min([100; length(sel)])));
displayData(X_test(wrongs,:)(sel, :), "misclassified");
printf("\nHere is the plot of misclassified digits.\nCompare this with the initial plot.\n\n");


