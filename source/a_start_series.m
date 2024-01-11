clc
close all

settings = Series_settings();
try
    % load last settings
    load('series_settings.mat');
    settings.SpinnerResampleSize.Value = S_size;
    settings.SpinnerStepClustering.Value = step_clustering;
    settings.SpinnerRmax.Value = Rmax;
    settings.EditDir1.Value = SampleDir1;
    settings.EditDir2.Value = SampleDir2;
    settings.EditShortName1.Value = SampleName1;
    settings.EditShortName2.Value = SampleName2;
catch
    % nothing to do
end

% wait till window is closed, OK or cancel is clicked
uiwait(settings.SeriesUIFigure);

if settings.Success
    %%%%%%%%%%%%%%% resampling paramters %%%%%%%%%%%%%%%
    Resampl_number = settings.SpinnerResampleNumber.Value;
    S_size = settings.SpinnerResampleSize.Value;
    step_clustering = settings.SpinnerStepClustering.Value;
    Rmax = settings.SpinnerRmax.Value;
    
    %%%%%%%%%%%%%%% sample information %%%%%%%%%%%%%%%
    SampleDir1 = settings.EditDir1.Value;
    SampleDir2 = settings.EditDir2.Value;
    SampleName1 = settings.EditShortName1.Value;
    SampleName2 = settings.EditShortName2.Value;
    
    %%%%%%%%%%%%%%% save settings %%%%%%%%%%%%%%%
    save('series_settings.mat','Resampl_number','S_size', ...
         'step_clustering','Rmax','SampleDir1','SampleDir2', ...
         'SampleName1','SampleName2');
     
    exts = {'.mat','.loc'};
    
    Amds = imageDatastore(SampleDir1, ...
        'IncludeSubfolders',true,'FileExtensions', ...
        exts,'LabelSource','foldernames');
    
    Bmds = imageDatastore(SampleDir2, ...
        'IncludeSubfolders',true,'FileExtensions', ...
        exts,'LabelSource','foldernames');
    
    clear('SampleDir1','SampleDir2');
    
    AlabelCount = numel(Amds.Labels);
    BlabelCount = numel(Bmds.Labels);
    
    NumSamp_A=AlabelCount;
    NumSamp_B=BlabelCount;
    
    dist=5:step_clustering:Rmax;
    Init_array;
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %%%%% weights for function and_term between KS and WX for density and curvature
    weight_density = 0.80;        %%%% between KS and WX
    weight_curvature = 0.80;      %%%% between KS and WX
    
    Global_parameter=0;       %%%%%%%%%%%%%%%% =1 turn off bootstrep %%%%%%%%
    
    Series_loading;
    
    settings.delete();
else
    settings.delete();
    close all;
    stop_calculation;
    quit cancel;
end