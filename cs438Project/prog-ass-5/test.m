clear; close all; clc
% Programming exercise 5 test script


% Test prepareY
printf("Testing the function prepareY\n")
printf("using y = [1 1 2 2 3 3]'\n")
y = [1 1 2 2 3 3]';
printf("Y = prepareY(y)\n");
Y = prepareY(y);
printf("Expected value of Y:\n  1  1  0  0  0  0\n  0  0  1  1  0  0\n  0  0  0  0  1  1\n\n");
printf("Found value of Y:\n");
Y

printf('\nProgram paused. Press enter to continue.');
pause;


% Test initTheta
printf("\n\nTesting the function initTheta.\n")
printf("using n = [3 2 4 2]'\n");
n = [3 2 4 2]';
Theta = initTheta(n);
printf("Theta = initTheta(n)\n");
if (!iscell(Theta))
	printf("Error: The returned Theta needs to be a cell array! Currently, Theta is not a cell array.\n");
end
printf("Expected size of the cell array Theta is [3, 1]\n");
printf("   Found size of the cell array Theta is [%d, %d]\n", rows(Theta), columns(Theta));
printf("Expected size of Theta{1} is [2, 4]\n");
printf("   Found size of Theta{1} is [%d, %d]\n", rows(Theta{1}), columns(Theta{1}));
printf("Expected size of Theta{2} is [4, 3]\n");
printf("   Found size of Theta{2} is [%d, %d]\n", rows(Theta{2}), columns(Theta{2}));
printf("Expected size of Theta{3} is [2, 5]\n");
printf("   Found size of Theta{3} is [%d, %d]\n", rows(Theta{3}), columns(Theta{3}));

for i = 1:rows(Theta)
	if (!(Theta{i} > -0.1 && Theta{i} < 0.1))
		printf("Error: Theta{%d} has values out of range!\n", i);
	end
	if (Theta{i} == 0)
		printf("Error: Theta{%d} has only 0 values! It must be initialized with random values instead.\n", i);
	end
	if (Theta{i} == Theta{i}(1))
		printf("Error: All elements of Theta{%d} have the same value! It must be initialized with randomized values instead.\n", i);
	end
end

printf('\nProgram paused. Press enter to test forwardPropagate.');
pause;

printf("\n\nLoading the test data ... ");
[X, y] = loadData("test-data.txt");
printf("done\n");

Y = prepareY(y);

m = rows(X);
n1 = columns(X);

n = [n1, 3, 2, max(y)];

Theta = initTheta(n);
v = toVector(Theta);
% Make it deterministic for testing
steps = 0.2 / (length(v)-1);
Theta = toMatrices(-0.1:steps:0.1, n);

printf("Testing the function forwardPropagate.\n")

A = forwardPropagate(Theta, X);

printf("Expected size of the cell array A is [4, 1]\n");
printf("   Found size of the cell array A is [%d, %d]\n", rows(A), columns(A));
printf("Expected value of A{1} is:\n   1   3   4   2\n   2   0   1   3\n");
printf("Found value of A{1} is:\n");
A{1}
printf("Expected value of A{2} is:\n   0.43447   0.42112   0.39261   0.40569\n   0.44343   0.43001   0.40569   0.41890\n   0.45242   0.43894   0.41890   0.43224\n");
printf("Found value of A{2} is:\n");
A{2}
printf("Expected value of A{3} is:\n   0.50158   0.50140   0.50111   0.50129\n   0.50688   0.50660   0.50615   0.50642\n");
printf("Found value of A{3} is:\n");
A{3}
printf("Expected value of A{4} is:\n   0.53422   0.53421   0.53420   0.53421\n   0.53876   0.53875   0.53873   0.53875\n");
printf("Found value of A{4} is:\n");
A{4}

printf('\nProgram paused. Press enter to test the cost function.');
pause;

printf("\nTesting the cost function J\n");

lambda = 1;
cost = J(Theta, A{end}, Y, lambda);
printf("  Expected cost: 1.398057\n");
printf("Calculated cost: %f\n", cost);

printf('\nProgram paused. Press enter to test backPropagate.');
pause;

printf("Testing the function backPropagate\n");

D = backPropagate(Theta, A, Y, lambda);

printf("Expected size of the cell array D is [3, 1]\n");
printf("   Found size of the cell array D is [%d, %d]\n", rows(D), columns(D));
printf("Expected value of D{1} is:\n   0.0000038434  -0.0181722799  -0.0113578531\n   0.0000178938  -0.0158646230  -0.0090639928\n   0.0000321266  -0.0135564126  -0.0067698830\n");
printf("Found value of D{1} is:\n");
D{1}
printf("Expected value of D{2} is:\n   0.00141457   0.00058497   0.00514601   0.00970718\n   0.00174592   0.00299470   0.00755940   0.01212425\n");
printf("Found value of D{2} is:\n");
D{2}
printf("Expected value of D{3} is:\n   0.034210   0.035332   0.040054\n   0.038749   0.039881   0.044627\n");
printf("Found value of D{3} is:\n");
D{3}


printf("\nIf your functions pass this test, then you are ready to execute the 'run' script.\n");

