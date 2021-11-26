function Y = prepareY(y)
	k = max(y);
	Y = zeros(length(y), k);
	for i=1:length(y)
		val = y(i, 1);
		Y(i, val) = 1;
		endfor
	Y = Y';
	end