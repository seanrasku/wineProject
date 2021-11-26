function [Theta, costs] = gradientDescent(Theta, X, Y, lambda, alpha, numIter)

	costs = [];

	for i=1:numIter

		A = forwardPropagate(Theta, X);

		costs = [costs J(Theta, A{end}, Y, lambda)];

		printf("Running gradient descent (%d). Cost = %f\r", (i-1), costs(end));

		D = backPropagate(Theta, A, Y, lambda);
		
		for l = 1:length(Theta)
			Theta{l} = Theta{l} - (alpha * D{l});
		end	
		
		if (i == -1)
			printf("\n");
			
			% reconstruct n vector for gradientCheck
			n = [];
			for j = 1:rows(Theta)
				n = [n columns(Theta{j})-1];
			end
			n = [n rows(Theta{end})];

			gradientCheck(Theta, X, Y, lambda, n);
		end

	end

	costs = [costs J(Theta, forwardPropagate(Theta, X){end}, Y, lambda)];
	printf("Running gradient descent (%d). Cost = %f\r", numIter, costs(end));
	printf("\n");

end
