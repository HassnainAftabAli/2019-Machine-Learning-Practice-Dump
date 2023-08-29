function [C, sigma] = dataset3Params(X, y, Xval, yval)
%DATASET3PARAMS returns your choice of C and sigma for Part 3 of the exercise
%where you select the optimal (C, sigma) learning parameters to use for SVM
%with RBF kernel
%   [C, sigma] = DATASET3PARAMS(X, y, Xval, yval) returns your choice of C and 
%   sigma. You should complete this function to return the optimal C and 
%   sigma based on a cross-validation set.
%

% You need to return the following variables correctly.
C = 0.01;
sigma = 0.01;

% ====================== YOUR CODE HERE ======================
% Instructions: Fill in this function to return the optimal C and sigma
%               learning parameters found using the cross validation set.
%               You can use svmPredict to predict the labels on the cross
%               validation set. For example, 
%                   predictions = svmPredict(model, Xval);
%               will return the predictions on the cross validation set.
%
%  Note: You can compute the prediction error using 
%        mean(double(predictions ~= yval))
%

count = 0;
minError = 99999999;
tempC = 0.01/3;

for cIter = 1:8
  tempC = tempC*3;
  tempSigma = 0.01/3;
  for sigmaIter= 1:8
    tempSigma = tempSigma*3;
    model= svmTrain(X, y, tempC, @(x1, x2) gaussianKernel(x1, x2, tempSigma));
    predictions = svmPredict(model, Xval);
    error = mean(double(predictions ~= yval));
    if error<minError
      minError = error;
      C = tempC;
      sigma = tempSigma;
    endif
  endfor
endfor

% =========================================================================

end
