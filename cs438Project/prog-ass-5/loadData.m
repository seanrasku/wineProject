function [X, y] = loadData(filename)
% This function loads x and y vectors

	% Load the data into a matrix
	data = csvread(filename);

	% Split the matrix into x and y vectors
	% don't load color
	X = data(2:end, 1:end-2);
	y = data(2:end, end-1) > 5;

end



