clear all; close all;
digits = load('digits.mat');
data = digits.data;

y = reshape(data(:, 45, 5), 16, 16);
imshow(y)