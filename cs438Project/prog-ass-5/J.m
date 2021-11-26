function cost = J(thetas, est, Y, reg)
	outer = 1/length(Y);
	log1 = -ln(est).*Y;
	log2 = -ln(1-est).*(1-Y);
	s = sum(sum(log1 + log2));
	sumsq = 0;
	for i=1:length(thetas)
		sumsq = sum(sum(thetas{i}.^2));
	endfor
	n = sum(sumsq);
	cost = outer * s + (reg*(.5*outer))*n;
end