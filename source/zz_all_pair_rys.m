

scrsz = get(0,'ScreenSize');
figure ('OuterPosition', [scrsz(3)/5.5 scrsz(4)/10 scrsz(4)/0.75 scrsz(4)/1.25]) ;
whitebg('w');
crt(1:numel(dist))=0.05;
%subplot('Position',[0.05, 0.11, 0.42, 0.8])
%('w');
%
%plot(dist,all_ks_conc,'-g')
%z=mean(all_ks_conc,2);
%nn=size(all_ks_conc,2);
 %hold on
  %plot(dist,z,'-k','linewidth',2)
  %plot(dist,crt,'-r','linewidth',2)
  %xlabel('Cluster size in nm')
  %ylabel('p value')
%title(['KS Test concentration ',num2str(nn),' pair'])

%subplot('Position',[0.51, 0.11, 0.42, 0.8])
whitebg('w');

 plot(dist,all_ks_ripl,'-g')
  z=mean(all_ks_ripl,2);
  nn=size(all_ks_ripl,2);
  hold on
  plot(dist,z,'-k','linewidth',2)
   plot(dist,crt,'-r','linewidth',2)
   xlabel('Cluster size in nm')
  ylabel('p value')
   title(['KS Test Ripley K-Function ',num2str(nn),' pair'])

figure ('OuterPosition', [scrsz(3)/5.5 scrsz(4)/3 scrsz(4)/0.75 scrsz(4)/2]) ;
whitebg('w');

subplot(1,3,1)
 plot(dist,all_ks_dens,'-g')
  z=mean(all_ks_dens,2);
  nn=size(all_ks_dens,2);
  hold on
  plot(dist,z,'-k','linewidth',2)
   plot(dist,crt,'-r','linewidth',2)
  xlabel('Cluster size in nm')
  ylabel('p value')
   title(['KS Test cluster-density ',num2str(nn),' pair'])
   
   
subplot(1,3,2)
whitebg('w')
 plot(dist,all_wilcox_dens,'-g')
  z=mean(all_wilcox_dens,2);
  nn=size(all_wilcox_dens,2);
  hold on
  plot(dist,z,'-k','linewidth',2)
   plot(dist,crt,'-r','linewidth',2)
  xlabel('Cluster size in nm')
  ylabel('p value')
  title(['wilcoxon Test cluster-density ',num2str(nn),' pair'])
   
  subplot(1,3,3)
whitebg('w')
 plot(dist,all_ave_dens_ks,'-g')
  z=mean(all_ave_dens_ks,2);
  nn=size(all_ave_dens_ks,2);
  hold on
  plot(dist,z,'-k','linewidth',2)
   plot(dist,crt,'-r','linewidth',2)
  xlabel('Cluster size in nm')
  ylabel('p value')
   title(['KS Test on average density ',num2str(nn),' pair'])  


figure ('OuterPosition', [scrsz(3)/5.5 scrsz(4)/3 scrsz(4)/0.75 scrsz(4)/2]) ;
whitebg('w');

subplot(1,3,1)
 plot(dist,all_ks_curv,'-g')
  z=mean(all_ks_curv,2);
  nn=size(all_ks_curv,2);
  hold on
  plot(dist,z,'-k','linewidth',2)
  plot(dist,crt,'-r','linewidth',2)
  xlabel('Cluster size in nm')
  ylabel('p value')
   title(['KS Test curvature ',num2str(nn),' pair'])
   
subplot(1,3,2)
 plot(dist,all_wilcox_curv,'-g')
  z=mean(all_wilcox_curv,2);
  nn=size(all_wilcox_curv,2);
  hold on
  plot(dist,z,'-k','linewidth',2)
  plot(dist,crt,'-r','linewidth',2)
  xlabel('Cluster size in nm')
  ylabel('p value')
   title(['wilcoxon Test curvature ',num2str(nn),' pair'])

   subplot(1,3,3)
 plot(dist,all_ave_curv_ks,'-g')
  z=mean(all_ave_curv_ks,2);
  nn=size(all_ave_curv_ks,2);
  hold on
  plot(dist,z,'-k','linewidth',2)
  plot(dist,crt,'-r','linewidth',2)
  xlabel('Cluster size in nm')
  ylabel('p value')
   title(['KS Test on average curvature ',num2str(nn),' pair'])