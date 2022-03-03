if exist('larg2standard','var')==1 && exist('larg1standard','var')==1

clc
pos1=posprim1;
pos2=posprim2;
answer_cluster_choose;

scrsz = get(0,'ScreenSize');
figure('Position', [scrsz(3)/5 scrsz(4)/10 scrsz(4)/0.74 scrsz(4)/1.25]);
hold on

grid on
eo=find(kt1rys==clust1);
dd00=pos1(eo,:);
xxm=min(dd00(:,1));
xxM=max(dd00(:,1));
yym=min(dd00(:,2));
yyM=max(dd00(:,2));
zzm=min(dd00(:,3));
zzM=max(dd00(:,3));

dd=dd00;
%subplot(1,2,1)
subplot('Position',[0.05, 0.15, 0.45, 0.7])
whitebg('w')

plot3(dd00(:,1),dd00(:,2),dd00(:,3),'ok','markerfacecolor','k','markersize',10, 'markeredgecolor','b')
hold on
plot3(xxM+5,yyM+5,zzM+1,'.w')
plot3(xxm-5,yym-5,zzm-1,'.w')
[K] = convhull(dd00);

trisurf(K,dd00(:,1),dd00(:,2),dd00(:,3),'FaceColor','c','facealpha',0.6)
clear('K')
grid on

%plot3(dd00(K,1),dd00(K,2),dd00(K,3),'*y')
plot3(dd00(:,1),dd00(:,2),dd00(:,3),'ok','markerfacecolor','k','markersize',10, 'markeredgecolor','r')

 %axis image
 view(2)
 xlabel('nm')
 title(['Cluster nr ',num2str(clust1),' (convex hull) of sample 1'])
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 
 %subplot(1,2,2)
 e1=find(kt2rys==clust2);
 dd11=pos2(e1,:);
    xxm=min(dd11(:,1));
    xxM=max(dd11(:,1));
    yym=min(dd11(:,2));
    yyM=max(dd11(:,2));
    zzm=min(dd11(:,3));
    zzM=max(dd11(:,3));

 subplot('Position',[0.505, 0.15, 0.45, 0.7])
 whitebg('w')
plot3(dd11(:,1),dd11(:,2),dd11(:,3),'ok','markerfacecolor','k','markersize',10, 'markeredgecolor','r')
hold on
plot3(xxM+5,yyM+5,zzM+1,'.w')
plot3(xxm-5,yym-5,zzm-1,'.w')
 [K] = convhull(dd11);
trisurf(K,dd11(:,1),dd11(:,2),dd11(:,3),'FaceColor','c','facealpha',0.6)
 
 grid on
 view(2)
 %axis image 
 xlabel('nm')
 title(['Cluster nr ',num2str(clust2),' (convex hull) of sample 2'])
 
  suptitle(['Cluster max. dimension ',num2str(R_standard),' nm   \newline',...
           exname1,' and ',exname2])
       


else
    disp('cluster do not exist' )
    hh=msgbox('Hierarchical clustering do not exist. Start Clustering','INFO','modal');
    pause(1)
    %close(hh)
    clear('hh')
    A_start;
end
    
 
       
clear('hfg','eo','dd00','e1','dd11','shp','clust1', 'clust2')
clear('dd','pos1' ,'pos2','scrsz','ans',...
     'xxm'  ,  'xxM','N'   ,  'yym'  ,   'yyM' ,'item'  ,  'zzm' ,'zzM' ,'cluster_id1' ,'cluster_id2')