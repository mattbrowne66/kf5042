clear; clc;
% Import the dataset'
data = readmatrix('creditcard.csv');

% Separate features andtarget variable
X = data(:, 1:end-1);
y = data(:, end);


% Normalize the features
normalized_features = normalize(X);

% Split data into train and test

ratio = 0.8; 
index = round(ratio * size(X, 1));

Xtrain = normalized_features(1:index, :);
ytrain = y(1:index, :);

Xtest = normalized_features(index+1:end, :);
ytest = y(index+1:end, :);
