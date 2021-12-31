load('R SIM.mat')
clc
%array2table(Sim_ripley_AVP,'VariableNames',xos,'RowNames',yos)
figure
whitebg('w')
h = heatmap(xos,yos,Sim_MLP);
%h.ColorScaling = 'scaledcolumns';
title('Similarity probability:  Method MLP')

