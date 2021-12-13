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
	lambda = 1;
	alpha = 2;
	maxIter = 500;
	figure("name", "Learning Curve");
	hold on;

	color = ['r-' 'g-' 'b-' 'k-' 'r*' 'g*' 'b*' 'k*'];
	for i = 1:50:m
		tx = trainX(1:i, :);
		ty = train_Y(:, 1:i);

		[Theta, nothingHere] = gradientDescent(Theta, tx, ty, lambda, alpha, maxIter);
		cost1 = J(Theta, forwardPropagate(Theta, tx){end}, ty, lambda)
		cost2 = J(Theta, forwardPropagate(Theta, X_test){end}, test_Y, lambda);
		plot(i, cost1, 'MarkerSize', 10);
		plot(i, cost2, 'MarkerSize', 10);
	endfor
end