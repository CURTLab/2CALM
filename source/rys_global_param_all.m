
scrsz = get(0,'ScreenSize');



figure ('OuterPosition', [scrsz(3)/20 scrsz(4)/10 scrsz(4)/0.6 scrsz(4)/1.25]) ;
whitebg('w');

subplot(2,2,1)
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
 subplot(2,2,2)
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
 subplot(2,2,3)
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
 
 subplot(2,2,4)
 plot(Curv1,'-b','linewidth',1);
 hold on
 plot(Curv2,'-r','linewidth',1);
 grid on
 mVol1(1:numel(Volum1(4,:)))=mean(Curv1);
 mVol2(1:numel(Volum1(4,:)))=mean(Curv2);
 plot(mVol1,'-b','linewidth',2) %%%%%%%%%% mean pvalue
 plot(mVol2,'-r','linewidth',2) %%%%%%%%%% mean pvalue

 legend('Large-Throm','Small-Throm','Mean Large','Mean Small')
 title('Curvature')
 suptitle(['Global parameter for sample ',endtext])