function learningCurve(X, y)

	sel = randperm(size(X, 1));

	X_test = X(sel(5201:end), :);
	trainX = X(sel(1:5200), :);
	y_test = y(sel(5201:end));
	trainY = y(sel(1:5200));

	m = rows(trainX);
	n1 = columns(X);
	n = [n1, 30, max(y)];

	train_Y= prepareY(trainY);
	test_Y = prepareY(y_test);
	Theta = initTheta(n);
	lambda = 0.65;
	alpha = 3;
	maxIter = 500;

	cost1 = [];
	cost2 = [];
	trainCost = [];
	testCost = [];

	for i = 1:30
		tx = trainX(1:i, :);
		ty = train_Y(:, 1:i);
		A = forwardPropagate(Theta, tx){end};
		B = forwardPropagate(Theta, X_test){end};

		[Theta, nothingHere] = gradientDescent(Theta, tx, ty, lambda, alpha, maxIter);
		cost1 = [cost1 J(Theta, A, ty, lambda)];
		disp("Cost = "), disp(cost1(end))
		trainCost = [trainCost cost1(end)];
		cost2 = [cost2 J(Theta, B, test_Y, lambda)];
		testCost = [testCost cost2(end)];

	endfor

	plotLearningCurve(trainCost, testCost);
end