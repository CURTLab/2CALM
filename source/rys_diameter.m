
figure
 
 plot(Volum1(4,:),'-b','linewidth',1);
 hold on
 plot(Volum2(4,:),'-r','linewidth',1);
 grid on
 mVol1(1:numel(Volum1(4,:)))=mean(Volum1(4,:));
 mVol2(1:numel(Volum1(4,:)))=mean(Volum2(4,:));
 plot(mVol1,'-b','linewidth',2) %%%%%%%%%% mean pvalue
 plot(mVol2,'-r','linewidth',2) %%%%%%%%%% mean pvalue

 legend('Large-Throm','Small-Throm','Mean Large','Mean Small')
 title('Diameter in nm')