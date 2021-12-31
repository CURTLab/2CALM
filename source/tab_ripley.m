load('R SIM.mat')
clc
%array2table(Sim_ripley_AVP,'VariableNames',xos,'RowNames',yos)
figure
whitebg('w')
h = heatmap(xos,yos,Sim_ripley_M);
title('Similarity M:  Method Ripley')

figure
whitebg('w')
h = heatmap(xos,yos,Sim_ripley_L);
title('Similarity L:  Method Ripley')

figure
whitebg('w')
h = heatmap(xos,yos,Sim_ripley_AVP);
title('Similarity average p-value:  Method Ripley')
