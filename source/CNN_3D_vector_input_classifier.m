% CNN accepts input upto three dimension and fourth dimension is the number of samples


clc;clear all;
trainD(:,:,:,1)=rand(22,5,3);
trainD(:,:,:,2)=rand(22,5,3);
trainD(:,:,:,3)=rand(22,5,3);
trainD(:,:,:,4)=rand(22,5,3);

targetD=categorical([0;0;1;1]);

%% Define Network Architecture
% Define the convolutional neural network architecture.
layers = [
    imageInputLayer([22 5 3]) % 22X5X3 refers to number of features per sample
    convolution2dLayer(5,16,'Padding','same') % 5x5 filtr is used, u can try 3x3 filtr also
    % padding -- same, means output of conv layer is same siz as input(automatic padding)
    % stride if not speficied means its 1; stride window movement steps os
    % speed over image
    % vist this website for easy cnn understanding, http://cs231n.github.io/convolutional-networks/
    reluLayer % activation function
    % i have not used any pooling layer here, since small data size
    % if u giving big data use pooling layer
    % pooling layer reduces size of the matrix
    fullyConnectedLayer(384) % 384 refers to number of neurons in next FC hidden layer
    fullyConnectedLayer(384) % 384 refers to number of neurons in next FC hidden layer
    fullyConnectedLayer(2) % 2 refers to number of neurons in next output layer (number of output classes)    
    softmaxLayer
    classificationLayer];

options = trainingOptions('sgdm',...
    'MaxEpochs',500, ...
    'Verbose',false,...
    'Plots','training-progress');

net = trainNetwork(trainD,targetD',layers,options);

predictedLabels = classify(net,trainD)'