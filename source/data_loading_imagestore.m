
clear
close all
rng('default')
tic
%% Create ImageDatastore Object 
imds = imageDatastore('../tiere_erkennung/small_data', ...
'IncludeSubfolders',true,'FileExtensions','.jpg','LabelSource','foldernames');    

disp('===========================================')
disp('Images data preparation. Please wait')

%% Loading the database from imds and coding each image as vector size1*size2.
%[V,BC,BN,BS,VE,VPC]=data_preparation(imds) ;


% Split into 80% Train and 20 %Test Data

[trainDigitData,testDigitData] = splitEachLabel(imds, ...
				0.8,'randomize');
labelCount = numel(categories(imds.Labels));

[Vtrain,BCtrain,BNtrain,BS,VEtrain,VPCtrain]=data_preparation(trainDigitData) ;
[Vtest,BCtest,BNtest,BS,VEtest,VPCtest]=data_preparation(testDigitData) ;
clc
disp('===========================================')
disp('Images data preparation - finish')
toc
disp('-------------------------------------------')
catt=numel( find(imds.Labels=='cats_rgb '));
dogt=numel( find(imds.Labels=='dogs_rgb '));
disp(['cats images ',num2str(catt),' dogs images ',num2str(dogt)])
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% end of data preparation %%%%%%%%%%%%%%%%%%%%%%