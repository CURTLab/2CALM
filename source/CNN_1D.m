%% Define Network Architecture
% Define the convolutional neural network architecture.
layers = [
    imageInputLayer([11 1 1]) % 11X1X1 refers to number of features per sample
    batchNormalizationLayer
    
    convolution2dLayer(3,32,'Padding',[1 3])
    reluLayer
    batchNormalizationLayer
    maxPooling2dLayer(2,'Stride',2)
    
    
    convolution2dLayer(3,12,'Padding',[1 3])
    reluLayer
    batchNormalizationLayer
    maxPooling2dLayer(2,'Stride',2)
    
    
    %dropoutLayer(0.05)
    %fullyConnectedLayer(120) %  refers to number of neurons in next FC hidden layer
    
   %fullyConnectedLayer(20) % refers to number of neurons in next FC hidden layer
     batchNormalizationLayer
    
    fullyConnectedLayer(2) % 2 refers to number of neurons in next output layer (number of output classes)
    softmaxLayer
    classificationLayer
    ];

%analyzeNetwork(layers);      
%uiwait(msgbox('Network Architecture. Start training','Result','modal'));
%close

options_l = trainingOptions(...
    'sgdm',...
    'MaxEpochs',30, ...
    'MiniBatchSize',200,...		% Mini Batch
    'Verbose',true,...
    'Plots','training-progress',...
    'InitialLearnRate',0.001, ...
    'ValidationFrequency',200,...
     'ValidationPatience', 10,...
     'ValidationData',{testD,testtagetD});  % Validation Data
    
  
     
net_cnn = trainNetwork(trainD,targetD',layers,options_l);

%predictedLabels = classify(net_cnn,trainD)';
YTestpr = classify(net_cnn,testD)';
accuracy = sum(YTestpr == testtagetD)/numel(testtagetD);

scrsz = get(0,'ScreenSize');
     figure ('OuterPosition', [scrsz(3)/5 scrsz(4)/24 scrsz(4)/1 scrsz(4)/1.05]) ;
     %confusionchart(testtagetD,YTestpr);
     plotconfusion(testtagetD,YTestpr);
     title(['CNN network. \newline Confusion matrix. Hit = ',num2str(accuracy*100),' %'])  

clear('options_l')