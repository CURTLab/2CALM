
figure
 
 plot(Volum1(3,:),'-b','linewidth',1);
 hold on
 plot(Volum2(3,:),'-r','linewidth',1);
 grid on
 mVol1(1:numel(Volum1(3,:)))=mean(Volum1(3,:));
 mVol2(1:numel(Volum1(3,:)))=mean(Volum2(3,:));
 plot(mVol1,'-b','linewidth',2) %%%%%%%%%% mean pvalue
 plot(mVol2,'-r','linewidth',2) %%%%%%%%%% mean pvalue

 legend('Large-Throm','Small-Throm','Mean Large','Mean Small')
 title('Volumen in nm^3')