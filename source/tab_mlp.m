load('R SIM.mat')
clc;
%array2table(Sim_ripley_AVP,'VariableNames',xos,'RowNames',yos)
figure;
whitebg('w');

% resize to correct length and remove underscore
nx = size(Sim_MLP, 2);
ny = size(Sim_MLP, 1);

xost = regexprep(xos(:,1:nx), '_', '\\_');
yost = regexprep(yos(1:ny,:), '_', '\\_');

h = heatmap(xost,yost,Sim_MLP);
%h.ColorScaling = 'scaledcolumns';
title('Similarity probability: Method MLP');
