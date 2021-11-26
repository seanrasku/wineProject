function [Theta] = toMatrices(theta, n)
% This function arranges the values in a linear vector into the Theta matrices.
% The size of the input vector has to match the total number of elements in all the Theta matrices colectively.
% The function 'toVector' does the reverse operation.

	Theta = cell(length(n) - 1, 1);

	% Number of the elements in the prior matrices
	prior = 0;
	
	for i = 2:length(n)

		ni = n(i);
		nj = n(i-1) + 1;
		
		% Number of elements in the current matrix
		current = ni * nj;
		
		% Generate the current matrix by using the related portion of theta
		Theta{i-1} = reshape(theta((prior + 1):(prior + current)), ni, nj);

		% Update the prior number of elements
		prior += current;
		
	end

end
