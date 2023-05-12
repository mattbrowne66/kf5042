clear; clc;
% Import the dataset'
data = readmatrix('creditcard.csv');

% Separate features andtarget variable
X = data(:, 1:end-1);
y = data(:, end);

% Sample the data to with all fraudulent and 2000 non
fraudnum = find(y == 1);
nonnum = find(y == 0);

fraudsamples = X(fraudnum, :);
nonsamples = datasample(X(nonnum, :), 2000, 'Replace', false);

features = [fraudsamples; nonsamples];
target = [y(fraudnum, :); zeros(2000, 1)];

% Normalize the features
normalized_features = normalize(features);

% Split data into train and test

ratio = 0.8; 
index = round(ratio * size(features, 1));

Xtrain = normalized_features(1:index, :);
ytrain = target(1:index, :);

Xtest = normalized_features(index+1:end, :);
ytest = target(index+1:end, :);
