function plotLearningCurve(TrainCost, TestCost)

	figure("name", "Cost during learning"); % open a new figure window
	hold on;
	
	%color = ['r-' 'g-' 'b-' 'k-' 'r*' 'g*' 'b*' 'k*'];
	x = 1:30;
	x2 = 1:30;
	plot(x, TrainCost, "g");
	plot(x2, TestCost, "b");

	%color2 = ['r-' 'g-' 'b-' 'k-' 'r*' 'g*' 'b*' 'k*'];
	
	%set(gca, 'linewidth', 2, 'fontsize', 22);
	xlabel('iterations'); % Set the x-axis label
	ylabel('cost'); % Set the y-axis label