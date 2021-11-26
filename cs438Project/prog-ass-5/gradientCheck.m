function gradientCheck(Theta, X, Y, lambda, n)

	A = forwardPropagate(Theta, X);
	
	D = backPropagate(Theta, A, Y, lambda);
	
	d = toVector(D);

	theta = toVector(Theta);
	
	epsilon = 0.0001;
	
	x = [];
	y = [];
	
	for j = 1:rows(theta)
	
		printf("Running gradient checking (%d / %d)\r", j, rows(theta));
		ep = (1:length(theta) == j)' * epsilon;
	
		g(j) = (J(toMatrices(theta + ep, n), A{end}, Y, lambda) - J(toMatrices(theta - ep, n), A{end}, Y, lambda)) / (2 * epsilon);

		x = [x g(j)];
		y = [y d(j)];

	endfor
	printf("\n");
	
	figure;
	plot(x, y, "ro", 'MarkerSize', 10);
	set(gca, 'linewidth', 2, 'fontsize', 22);
	xlabel('by epsilon'); % Set the x-axis label
	ylabel('by back propagation'); % Set the y-axis label

end
