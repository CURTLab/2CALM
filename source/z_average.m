


figure ('OuterPosition', [scrsz(3)/5.5 scrsz(4)/10 scrsz(4)/0.75 scrsz(4)/1.25]) ;
whitebg('w');
subplot(1,2,1)
whitebg('w')
 plot(dist,all_ave_curv1,'-g')
 hold on
 plot(dist,all_ave_curv2,'-y')
  z1=mean(all_ave_curv1,2);
  z2=mean(all_ave_curv2,2);
 % nn=size(all_ave_dens_ks,2);
  hold on
  plot(dist,z1,'-k','linewidth',2)
   plot(dist,z2,'-b','linewidth',2)
 xlabel('Cluster size in nm')
  ylabel('curvature value')
   title(['average curvature, blue sample1, black sample 2'])
   
   
   
subplot(1,2,2)
 plot(dist,all_ave_dens1,'-g')
 hold on
 plot(dist,all_ave_dens2,'-y')
  z1=mean(all_ave_dens1,2);
  z2=mean(all_ave_dens2,2);
  nn=size(all_ave_dens_ks,2);
  hold on
  plot(dist,z1,'-k','linewidth',2)
   plot(dist,z2,'-b','linewidth',2)
    xlabel('Cluster size in nm')
  ylabel('density value')
   title(['average density, blue sample1, black sample 2'])