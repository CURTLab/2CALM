
atr_prim_dat_check;
pos1=posprim1;
pos2=posprim2;
answer_primary_cluster_choose;

scrsz = get(0,'ScreenSize');
figure('Position', [scrsz(3)/5 scrsz(4)/10 scrsz(4)/0.74 scrsz(4)/1.25]);
hold on

grid on
eo=find(cl1==clust1);
dd00=pos1(eo,:);
xxm=min(dd00(:,1));
xxM=max(dd00(:,1));
yym=min(dd00(:,2));
yyM=max(dd00(:,2));
zzm=min(dd00(:,3));
zzM=max(dd00(:,3));




e1=find(cl2==clust2);
dd11=pos2(e1,:);


%subplot(1,2,1)
subplot('Position',[0.05, 0.15, 0.45, 0.7])
whitebg('w')

plot3(dd00(:,1),dd00(:,2),dd00(:,3),'ok','markerfacecolor','k','markersize',8, 'markeredgecolor','r')
hold on
plot3(xxM+100,yyM+100,zzM+50,'.w')
plot3(xxm-100,yym-100,zzm-50,'.w')

 shp = alphaShape(dd00);
 plot(shp,'FaceAlpha',0.6)
 grid on
 axis image
 view(2)
  xlabel('nm')
 title(['Primary clusters nr ',num2str(clust1),' of sample 1'])

 
 %subplot(1,2,2)
 subplot('Position',[0.5, 0.15, 0.45, 0.7])
    xxm=min(dd11(:,1));
    xxM=max(dd11(:,1));
    yym=min(dd11(:,2));
    yyM=max(dd11(:,2));
    zzm=min(dd11(:,3));
    zzM=max(dd11(:,3));


 
 
 
 whitebg('w')
 plot3(dd11(:,1),dd11(:,2),dd11(:,3),'ok','markerfacecolor','k','markersize',8, 'markeredgecolor','r')
 hold on
 plot3(xxM+100,yyM+100,zzM+50,'.w')
 plot3(xxm-100,yym-100,zzm-50,'.w')
 hold on
 shp = alphaShape(dd11);
 plot(shp,'FaceAlpha',0.6)
 grid on
 view(2)
 axis image 
 xlabel('nm')
 title(['Primary clusters nr ',num2str(clust2),' of sample 2'])
 
  suptitle(['Primary cluster for ',num2str(RRmax),' nm  radius  \newline',...
           exname1,' and ',exname2])
       


   
 
       
clear('hfg','eo','dd00','e1','dd11','shp','clust1', 'clust2')

 clear('dd','pos1' ,'pos2','scrsz','ans',...
     'xxm'  ,  'xxM','N'   ,  'yym'  ,   'yyM' ,'item'  ,  'zzm' ,'zzM' ,'cluster_id1' ,'cluster_id2')

