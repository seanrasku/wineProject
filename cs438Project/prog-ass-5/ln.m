function [x] = ln(x)
% Fixes the -Inf problem of the built-in log function when x is very close to zero

%	x = max(log(x), log(1e-323));
	x = max(log(x), log(1e-300));

end
