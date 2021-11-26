function M = loadData(filename)
	string = fileread(filename);
	cellArr = strsplit(string, {'\n'})
	cellArr
	%inArr = [];
	for i = 1 : 1600
		change = cellArr{1, i};
		change;
		cellArr{1, i} = [strsplit(change, ";")];
	endfor
	cellArr
end

