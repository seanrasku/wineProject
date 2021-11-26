function cellArr = initTheta(n)
	cellArr = cell(length(n) - 1, 1);
	for l = 1:length(cellArr)
		cellArr {l} = -0.1 + (0.1 - (-0.1)) * rand(n(l+1), n(l) + 1);
	endfor
end
