% CNN accepts input upto three dimension and fourth dimension is the number of samples


clc;clear all;
trainD(:,:,:,1)=rand(22,5,1);
trainD(:,:,:,2)=rand(22,5,1);
trainD(:,:,:,3)=rand(22,5,1);
trainD(:,:,:,4)=rand(22,5,1);
trainD(:,:,:,5)=rand(22,5,1);
trainD(:,:,:,6)=rand(22,5,1);
targetD=categorical([1;2;3;4;5;6]);

%% Define Network Architecture
% Define the convolutional neural network architecture.
layers = [
    imageInputLayer([22 5 1]) % 22X5X1 refers to number of features per sample
    convolution2dLayer(5,16,'Padding','same')
    reluLayer
    fullyConnectedLayer(384) % 384 refers to number of neurons in next FC hidden layer
    fullyConnectedLayer(384) % 384 refers to number of neurons in next FC hidden layer
    fullyConnectedLayer(6) % 6 refers to number of neurons in next output layer (number of output classes)
    softmaxLayer
    classificationLayer];

options = trainingOptions('sgdm',...
    'MaxEpochs',5000, ...
    'Plots','training-progress');

net = trainNetwork(trainD,targetD',layers,options);

predictedLabels = classify(net,trainD)'