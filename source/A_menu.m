


%%%%%%%%%%% List of tasks %%%%%%%%%%%%%%%%%%%%%%%%%%
lista={'START CALCULATION',...          %task 1 
'LOAD RESULT',...                       %task 2
'PLOT SAMPLES',...                      %task 3
'PLOT RIPLEY ANALYSE',...               %task 4
'PLOT DENSITY ANALYSE',...              %task 5
'PLOT MLP ',...                         %task 6
'PLOT TABLES RIPLEY',...                %task 7
'PLOT TABLES DENSITY',...               %task 8
'PLOT TABLES MLP',...                   %task 9
'HISTOGRAMS',...                        %task 10
'CLOSE ALL FIGURES',...                 %task 11
'DELETE ALL RESULTS',...                %task 12
'PLOT SERIES PARAMETER',...             %task 13
'EXIT'};                                %task 14

clc
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
options.Interpreter = 'latex';
figure(2000)
whitebg([0,0,50]/255) % background color
close figure 2000
task=menu_w('SELECT TASK',lista);
clear('lista')
 