function actMat = forwardPropagate(thetas, X)
	actMat = cell(length(thetas) + 1, 1);
	actMat {1} = X';

	for l = 2:length(actMat)
		temp = [ones(1, size(actMat{l - 1}, 2)) ; actMat{l - 1}];
		actMat{l} = g(thetas{l - 1}*temp);
	endfor
end


