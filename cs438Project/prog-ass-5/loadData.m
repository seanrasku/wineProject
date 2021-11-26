function [X, y] = loadData(filename)
% This function loads x and y vectors

	% Load the data into a matrix
	data = load(filename);

	% Split the matrix into x and y vectors
	X = data(:, 1:end-1);
	y = data(:, end);

end



