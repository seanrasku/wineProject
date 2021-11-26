function D = backPropagate(thetas, A, Y, reg)
	L = length(A);
	D = cell(L, 1);
	del = cell(L, 1);
	del{L} = A{L} - Y;
	for l = L - 1:-1: 2
		matT = thetas{l};
		matT = matT(:, 2:end);
		del{l} = matT' * del{l + 1} .* (A{l} .*(1 - A{l}));
	endfor
	for l = 1 : L-1
		temp = [ones(1, size(A{l}, 2)) ; A{l}];
		matT = thetas{l};
		matT = matT(:, 2:end);
		D{l} = (del{l + 1} * temp');
		f = D{l};
		n = f(:, 2:end);
		p = f(:, 1);
		notZero = n + (reg * matT);
		D{l} = [p notZero]./length(Y);
	endfor
	D
end
