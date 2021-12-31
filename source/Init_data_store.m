clc
clear

Amds = imageDatastore('./DATA_ORG/Grosse_Thrombozyten_roi', ...
'IncludeSubfolders',true,'FileExtensions','.mat','LabelSource','foldernames');    


Bmds = imageDatastore('./DATA_ORG/Kleine_Thrombozyten_roi', ...
'IncludeSubfolders',true,'FileExtensions','.mat','LabelSource','foldernames');    

endtext='roi\';            %%%%%%%%%%%%% Thrombozyten_roi
%endtext= 'original\';     %%%%%%%%%%%%% Thrombozyten_original 


AlabelCount = numel(Amds.Labels);
BlabelCount = numel(Bmds.Labels);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 NumSamp_A=AlabelCount;
 NumSamp_B=29;%BlabelCount;
 
 %%%%%%%%%%%%%%%%%%%%%%%%%%% resampling paramters %%%%%%%%%%%%%%%
  Resampl_number = 50;                %%%%%%%%%%%%%%%% number of resamples
  S_size = 1000;            %%%%%%%%%%%%%%%%% size of resample
  Rmax = 300;               %%%%%%%%%%%%%%%% max size of cluster in nm
  step_clustering = 10;     %%%%%%%%%%%%%%% step for growing cluster size
 
  dist=5:step_clustering:Rmax;
  Init_array;
  
  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  %%%%% weights for function and_term between KS and WX for density and curvature 
  weight_density = 0.80;        %%%% between KS and WX
  weight_curvature = 0.80;      %%%% between KS and WX
  
  Global_parameter=0;       %%%%%%%%%%%%%%%% =1 turn off bootstrep %%%%%%%%
  
  %%% The rest weights for aggregation all levels are in file
  %%% 'a_aggregation' %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%