function [theta] = toVector(Theta)
% Rearranges the element in the given Theta matrices into a single vector.
% The function 'toMatrices' does the reverse operation.

	theta = [];
	
	for i = 1:length(Theta)
	
		theta = [theta ; Theta{i}(:)];
	
	end

end
