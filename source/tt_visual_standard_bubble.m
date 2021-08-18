

if exist('larg2standard','var')==1 && exist('larg1standard','var')==1

clc
pos1=posprim1;
pos2=posprim2;
answer_cluster_choose;

scrsz = get(0,'ScreenSize');
figure('Position',  [scrsz(3)/5 scrsz(4)/10 scrsz(4)/0.74 scrsz(4)/1.25]);
hold on

grid on
eo=find(kt1rys==clust1);
dd00=pos1(eo,:);


%subplot(1,2,1)
subplot('Position',[0.05, 0.15, 0.45, 0.7])
whitebg('w')

plot3(dd00(:,1),dd00(:,2),dd00(:,3),'ok','markerfacecolor','k','markersize',10, 'markeredgecolor','r')
hold on
aa=growbubbles(dd00) ;
hold on
 shp = alphaShape(dd00);
 plot(shp,'FaceAlpha',0.4)
 grid on
 %axis image
 view(3)
 xlabel('nm')
 title(['Cluster nr ',num2str(clust1),' of sample 1'])
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
 %subplot(1,2,2)
 subplot('Position',[0.505, 0.15, 0.45, 0.7])
 e1=find(kt2rys==clust2);
 dd11=pos2(e1,:);
 whitebg('w')
 plot3(dd11(:,1),dd11(:,2),dd11(:,3),'ok','markerfacecolor','k','markersize',10, 'markeredgecolor','r')
 hold on
 hold on
aa=growbubbles(dd11) ;
hold on
 shp = alphaShape(dd11);
 plot(shp,'FaceAlpha',0.4)
 grid on
 view(3)
 %axis image 
 xlabel('nm')
 title(['Cluster nr ',num2str(clust2),' of sample 2'])
 
 suptitle(['Cluster max. dimension ',num2str(R_standard),' nm  \newline',...
          exname1,' and ',exname2])

else
    clear('x','cluster_id1','cluster_id2','hh')
    A_start;
    quit cancel
end
    
 
       

clear('hfg','eo','dd00','e1','dd11','shp','clust1', 'clust2','aa')
clear('dd','pos1' ,'pos2','scrsz','ans',...
    'cluster_id1' ,'cluster_id2')
