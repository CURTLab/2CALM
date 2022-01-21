


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
'PLOT CONFUSION',...                    %task 10
'HISTOGRAMS',...                        %task 11
'CLOSE ALL FIGURES',...                 %task 12
'DELETE ALL RESULTS',...                %task 13
'PLOT SERIES PARAMETER',...             %task 14
'EXIT'};                                %task 15

clc
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
options.Interpreter = 'latex';
figure(2000)
whitebg([0,0,50]/255) % background color
close figure 2000
task=menu_w('SELECT TASK',lista);
clear('lista')
 