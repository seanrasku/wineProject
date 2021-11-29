function y = prepY(z)
	y = z;
	y(z <= 5) = 1;
	y(z > 5) = 2
end