clc;
clear ;
trainD(:,:,:,1)=rand(22,1,1);
trainD(:,:,:,2)=rand(22,1,1);
trainD(:,:,:,3)=rand(22,1,1);
trainD(:,:,:,4)=rand(22,1,1);
trainD(:,:,:,5)=rand(22,1,1);
trainD(:,:,:,6)=rand(22,1,1);
trainD(:,:,:,7)=rand(22,1,1);
trainD(:,:,:,8)=rand(22,1,1);
trainD(:,:,:,9)=rand(22,1,1);
trainD(:,:,:,10)=rand(22,1,1);
targetD=categorical([0;0;1;0;0;1;1;1;0;1]);

%% Define Network Architecture
% Define the convolutional neural network architecture.
layers = [
    imageInputLayer([22 1 1]) % 22X1X1 refers to number of features per sample
    convolution2dLayer(3,16,'Padding',[3 3])
    reluLayer
    fullyConnectedLayer(384) % 384 refers to number of neurons in next FC hidden layer
    fullyConnectedLayer(384) % 384 refers to number of neurons in next FC hidden layer
    fullyConnectedLayer(2) % 2 refers to number of neurons in next output layer (number of output classes)
    softmaxLayer
    classificationLayer
    ];

options = trainingOptions(...
    'sgdm',...
    'MaxEpochs',1000, ...
    'MiniBatchSize',10,...		% Mini Batch
    'Verbose',true,...
    'Plots','training-progress',...
    'InitialLearnRate',0.005...
    ); ...	
     
net = trainNetwork(trainD,targetD',layers,options);

predictedLabels = classify(net,trainD)'