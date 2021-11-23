%% Define Network Architecture
% Define the convolutional neural network architecture.


layers = [
    imageInputLayer([11 1 1]) % 11X1X1 refers to number of features per sample
    batchNormalizationLayer
    
   
    %fullyConnectedLayer(120) %  refers to number of neurons in next FC hidden layer
    
    fullyConnectedLayer(100) % refers to number of neurons in next FC hidden layer
    
    %batchNormalizationLayer
    %dropoutLayer(0.01)
    
    fullyConnectedLayer(2) % 2 refers to number of neurons in next output layer (number of output classes)
    softmaxLayer
    classificationLayer
    ];
analyzeNetwork(layers);      
uiwait(msgbox('Network Architecture. Start training','Result','modal'));
close
options = trainingOptions(...
    'sgdm',...
    'MaxEpochs',30, ...
    'MiniBatchSize',300,...		% Mini Batch
    'Verbose',true,...
    'Plots','training-progress',...
    'InitialLearnRate',0.001, ...
    'ValidationFrequency',200,...
     'ValidationPatience', 10,...
     'ValidationData',{testD,testtagetD});  % Validation Data
    
  
     
net_fc = trainNetwork(trainD,targetD',layers,options);

%predictedLabels = classify(net_fc,trainD)';

YTestpr = classify(net_fc,testD)';
accuracy = sum(YTestpr == testtagetD)/numel(testtagetD)

scrsz = get(0,'ScreenSize');
     figure ('OuterPosition', [scrsz(3)/5 scrsz(4)/24 scrsz(4)/1 scrsz(4)/1.05]) ;
     %confusionchart(testtagetD,YTestpr);
     plotconfusion(testtagetD,YTestpr);
     title(['CNN-FC network. \newline Confusion matrix. Hit = ',num2str(accuracy*100),' %'])  

