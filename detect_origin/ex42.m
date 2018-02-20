%% Machine Learning Online Class - Exercise 4 Neural Network Learning

%  Instructions
%  ------------
% 
%  This file contains code that helps you get started on the
%  linear exercise. You will need to complete the following functions 
%  in this exericse:
%
%     sigmoidGradient.m
%     randInitializeWeights.m
%     nnCostFunction.m
%
%  For this exercise, you will not need to change any code in this file,
%  or any other files other than those mentioned above.
%

%% Initialization
clear ; close all; clc

%% Setup the parameters you will use for this exercise
input_layer_size  = 1311;  % 20x20 Input Images of Digits
hidden_layer_size = 50;   % 25 hidden units
num_labels = 5;          % 10 labels, from 1 to 10   
                          % (note that we have mapped "0" to label 10)

%% =========== Part 1: Loading and Visualizing Data =============
%  We start the exercise by first loading and visualizing the dataset. 
%  You will be working with a dataset that contains handwritten digits.
%
% Load Training Data
fprintf('Loading and Visualizing Data ...\n')

%load('ex4data1.mat');
m = size(X, 1);

% Randomly select 100 data points to display
%sel = randperm(size(X, 1));
%sel = sel(1:100);
displayData(X(:,1:1600));



%% 


displayData(X2(:,1:1600));

fprintf('Program paused. Press enter to continue.\n');
pause;
%% ================ Part 2: Loading Parameters ================
% In this part of the exercise, we load some pre-initialized 
% neural network parameters.

fprintf('\nLoading Saved Neural Network Parameters ...\n')

% Load the weights into variables Theta1 and Theta2
%load('ex4weights.mat');
data = csvread('train2.txt');
X = normalised_diff(data(:,1:input_layer_size)); %training
y = data(:,input_layer_size + 1);


data2 = csvread('test2.txt');
X2 = normalised_diff(data2(:,1:input_layer_size)); %test
y2 = data2(:,input_layer_size + 1);

% for i = 1:size(y,1)
%     if(y(i)== 0)
%         y(i) = 2;
%     end
% end

% for i = 1:size(X,1) %Feature scaling?
%     for j = 1:size(X,2)
%         X(i,j) = (X(i,j)-mean(X(j,:)))/(range(X(j,:)));
%     end
% end

% Unroll parameters 
initial_Theta1 = randInitializeWeights(input_layer_size, hidden_layer_size);
initial_Theta2 = randInitializeWeights(hidden_layer_size, num_labels);

% Unroll parameters
initial_nn_params = [initial_Theta1(:) ; initial_Theta2(:)];

nn_params = [initial_Theta1(:) ; initial_Theta2(:)];

%% ================ Part 3: Compute Cost (Feedforward) ================


%% =============== Part 4: Implement Regularization ===============


%% ================ Part 5: Sigmoid Gradient  ================


%% ================ Part 6: Initializing Pameters ================
%  In this part of the exercise, you will be starting to implment a two
%  layer neural network that classifies digits. You will start by
%  implementing a function to initialize the weights of the neural network
%  (randInitializeWeights.m)

fprintf('\nInitializing Neural Network Parameters ...\n')

initial_Theta1 = randInitializeWeights(input_layer_size, hidden_layer_size);
initial_Theta2 = randInitializeWeights(hidden_layer_size, num_labels);

% Unroll parameters
initial_nn_params = [initial_Theta1(:) ; initial_Theta2(:)];


%% =============== Part 7: Implement Backpropagation ===============
%  Once your cost matches up with ours, you should proceed to implement the
%  backpropagation algorithm for the neural network. You should add to the
%  code you've written in nnCostFunction.m to return the partial
%  derivatives of the parameters.
%
fprintf('\nChecking Backpropagation... \n');

%  Check gradients by running checkNNGradients
checkNNGradients;

fprintf('\nProgram paused. Press enter to continue.\n');
pause;


%% =============== Part 8: Implement Regularization ===============
%  Once your backpropagation implementation is correct, you should now
%  continue to implement the regularization with the cost and gradient.
%

fprintf('\nChecking Backpropagation (w/ Regularization) ... \n')

%  Check gradients by running checkNNGradients
lambda = 3; %original: 3
checkNNGradients(lambda);

% Also output the costFunction debugging values
debug_J  = nnCostFunction(nn_params, input_layer_size, ...
                          hidden_layer_size, num_labels, X, y, lambda);

fprintf(['\n\nCost at (fixed) debugging parameters (w/ lambda = %f): %f ' ...
         '\n(for lambda = 3, this value should be about 0.576051)\n\n'], lambda, debug_J);

fprintf('Program paused. Press enter to continue.\n');
pause;


%% =================== Part 8: Training NN ===================
%  You have now implemented all the code necessary to train a neural 
%  network. To train your neural network, we will now use "fmincg", which
%  is a function which works similarly to "fminunc". Recall that these
%  advanced optimizers are able to train our cost functions efficiently as
%  long as we provide them with the gradient computations.
%
fprintf('\nTraining Neural Network... \n')

%  After you have completed the assignment, change the MaxIter to a larger
%  value to see how more training helps.
options = optimset('MaxIter', 2000);

%  You should also try different values of lambda
lambda = 1; %original: 1

% Create "short hand" for the cost function to be minimized
costFunction = @(p) nnCostFunction(p, ...
                                   input_layer_size, ...
                                   hidden_layer_size, ...
                                   num_labels, X, y, lambda);

% Now, costFunction is a function that takes in only one argument (the
% neural network parameters)
[nn_params, cost] = fmincg(costFunction, initial_nn_params, options);

% Obtain Theta1 and Theta2 back from nn_params
Theta1 = reshape(nn_params(1:hidden_layer_size * (input_layer_size + 1)), ...
                 hidden_layer_size, (input_layer_size + 1));

Theta2 = reshape(nn_params((1 + (hidden_layer_size * (input_layer_size + 1))):end), ...
                 num_labels, (hidden_layer_size + 1));

fprintf('Program paused. Press enter to continue.\n');
pause;


%% ================= Part 9: Visualize Weights =================
%  You can now "visualize" what the neural network is learning by 
%  displaying the hidden units to see what features they are capturing in 
%  the data.

fprintf('\nVisualizing Neural Network... \n')

displayData(Theta1(:, 1:1600));

fprintf('\nProgram paused. Press enter to continue.\n');
pause;

%% ================= Part 10: Implement Predict =================
%  After training the neural network, we would like to use it to predict
%  the labels. You will now implement the "predict" function to use the
%  neural network to predict the labels of the training set. This lets
%  you compute the training set accuracy.

pred = predict(Theta1, Theta2, X);

pred2 = predict(Theta1, Theta2, X2);

m = size(X2, 1);
num_labels = size(Theta2, 1);
% You need to return the following variables correctly 
p = zeros(size(X2, 1), 1);
h1 = sigmoid([ones(m, 1) X2] * Theta1');
h2 = sigmoid([ones(m, 1) h1] * Theta2');

fprintf('\nTraining Set Accuracy: %f', mean(double(pred == y)) * 100);

total_positive = 0;
true_positive = 0;
false_positive = 0;
false_negative = 0;
for i = 1:size(X,1)
    if(pred(i)== 1)
        total_positive = total_positive + 1;
        if(y(i)==1)
            true_positive = true_positive + 1;
        end
        if(y(i)==0)
            false_positive = false_positive + 1;
        end
    end
    if(pred(i) == 2 & y(i) == 1)
        false_negative = false_negative + 1;
    end
end
testtotal_positive = 0;
testtrue_positive = 0;
testfalse_positive = 0;
testfalse_negative = 0;
for i = 1:size(X2,1)
    if(pred2(i)== 1)
        testtotal_positive = testtotal_positive + 1;
        if(y2(i)==1)
            testtrue_positive = testtrue_positive + 1;
        end
        if(y2(i)==0)
            testfalse_positive = testfalse_positive + 1;
        end
    end
    if(pred2(i) == 2 && y2(i) == 1)
        testfalse_negative = testfalse_negative + 1;
    end
end

trainprecision = (true_positive/total_positive);
trainrecall = (true_positive/(true_positive + false_negative));

testprecision = (testtrue_positive/testtotal_positive);
testrecall = (testtrue_positive/(testtrue_positive+testfalse_negative));


fprintf('\nTraining Set Precision: %f', trainprecision*100);
fprintf('\nTraining Set Recall: %f', trainrecall*100);
fprintf('\nTraining Set F-Score: %f', (2*trainprecision*trainrecall)/(trainprecision+trainrecall) * 100);

fprintf('\nTraining Set Precision: %f', testprecision*100);
fprintf('\nTraining Set Recall: %f', testrecall*100);
fprintf('\nTraining Set F-Score: %f', (2*testprecision*testrecall)/(testprecision+testrecall) * 100);

% prediction = 0;
% actual = 0;
% for i = 1:size(pred2,1)
%     if(pred2(i) == 1)
%         prediction = prediction + 1;
%     end
%     if(y2(i)==1)
%         actual = actual + 1;
%     end
% end
% prediction
% actual
        
