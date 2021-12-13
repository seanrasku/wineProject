function plotLearningCurve(TrainCost, TestCost)

	figure("name", "Cost during learning"); % open a new figure window
	hold on;
	
	color = ['r-' 'g-' 'b-' 'k-' 'r*' 'g*' 'b*' 'k*'];
	
	for	i = 1:rows(TrainCost)
	
		plot(0:length(TrainCost(i, :))-1, TrainCost(i, :), color(i), 'MarkerSize', 10);
	
	end

	color2 = ['r-' 'g-' 'b-' 'k-' 'r*' 'g*' 'b*' 'k*'];
	
	for	i = 1:rows(TestCost)
	
		plot(0:length(TestCost(i, :))-1, TestCost(i, :), color2(i), 'MarkerSize', 10);
	
	end
	
	set(gca, 'linewidth', 2, 'fontsize', 22);
	xlabel('iterations'); % Set the x-axis label
	ylabel('cost'); % Set the y-axis label