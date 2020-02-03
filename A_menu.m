


%%%%%%%%%%% List of tasks %%%%%%%%%%%%%%%%%%%%%%%%%%
lista={'LOAD new data',...              %task 1 1
'RELOAD the latest data',...            %task 2 2
'Current SAMPLE LABELS',...                     %task 3 3
'PLOT current samples (2D/3D)',...      %task 4 4
'CLOSE all figures',...                     %task 16 5
'DATA STATUS and restore',...           %task 17 6
'Outliers FILTERING',...                %task 5 7
'Manual EXTRACTION of regions',...      %task 6 8
'Automatic EXTRACTION of regions',...   %task 7 9
'RANDOM-SAMPLE generation',...          %task 18 10
'Sample EQUALIZATION',...               %task 10 11
'Bootstrap 3D-RIPLEY',...           %task 19 12
'Bootstrap DENSITY/CURVATURE',...   %task 8 13
'Bootstrap PRIMARY-CL DENSITY ',...    %task 9 14
'MACHINE LEARNING',...                  %task 13 15
'CLUSTERING ONE sample pair',...                %task 11 16
'Cluster VISUALIZATION',...             %task 12 17
'SAVE current result',...                %task 14 18
'OPEN result',...                       %task 15 19
'IMPORT DATA from Excel',...
'EXIT'};                                %task 20

clc
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
options.Interpreter = 'tex';
figure(2000)
whitebg([0,0,50]/255) % background color
close figure 2000
task=menu_w('SELECT TASK',lista);
clear('lista')
 