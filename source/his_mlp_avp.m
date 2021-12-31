
figure
whitebg('w')


hi=histogram(Sim_MLP,10,'Facecolor','g');
ylim([0,max(hi.Values)+0.5])
xlim([0,1])
hold on
plot(0,0,'.w')
grid on
line([0.5,0.5],[0,max(hi.Values)+0.5],'color','r','linewidth',3)
title('Histogram of all pairs. MLP Probability')
xlabel('Value')
ylabel('Number of pair')



figure
hi=histogram(Sim_boot_AVP,10,'Facecolor','c');
ylim([0,max(hi.Values)+0.5])
hold on
plot(0,0,'.w')
grid on
line([0.05,0.05],[0,max(hi.Values)+0.5],'color','r','linewidth',3)
title('Histogram of all pairs. Density: average p-value')
xlabel('Value')
ylabel('Number of pair')
xlim([0,1])

figure
hi=histogram(Sim_ripley_AVP,10,'Facecolor','m');
ylim([0,max(hi.Values)+0.5])
hold on
plot(0,0,'.w')
grid on
line([0.05,0.05],[0,max(hi.Values)+0.5],'color','r','linewidth',3)
title('Histogram of all pairs. Ripley: average p-value')
xlabel('Value')
ylabel('Number of pair')
%xlim([0,1])