load('R SIM.mat')
clc
%array2table(Sim_ripley_AVP,'VariableNames',xos,'RowNames',yos)
figure
whitebg('w')
h = heatmap(xos,yos,Sim_boot_M);
title('Similarity M:  Method Density')

figure
whitebg('w')
h = heatmap(xos,yos,Sim_boot_L);
title('Similarity L:  Method Density')

figure
whitebg('w')
h = heatmap(xos,yos,Sim_boot_AVP);
title('Similarity average p-value:  Method Density')
