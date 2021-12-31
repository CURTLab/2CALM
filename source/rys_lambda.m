figure
 
 plot(Lambda_dens1(3,:),'-b','linewidth',1);
 hold on
 plot(Lambda_dens2(3,:),'-r','linewidth',1);
 grid on
 mVol1(1:numel(Volum1(4,:)))=mean(Lambda_dens1(3,:));
 mVol2(1:numel(Volum1(4,:)))=mean(Lambda_dens2(3,:));
 plot(mVol1,'-b','linewidth',1) %%%%%%%%%% mean pvalue
 plot(mVol2,'-r','linewidth',1) %%%%%%%%%% mean pvalue

 legend('Large-Throm','Small-Throm','Mean Large','Mean Small')

 title('Density in 1/nm^3')