

atr_prim_dat_check;
clc
pos1=posprim1;
pos2=posprim2;




scrsz = get(0,'ScreenSize');
figure ('OuterPosition',  [scrsz(3)/4.7 scrsz(4)/10 scrsz(4)/0.8 scrsz(4)/1.25]) ;
whitebg('k');

%subplot(2,1,1)
subplot('Position',[0.01, 0.11, 0.49, 0.8])
pos =pos1;
cl=cl1;
c_prim=c_primar1;

zam=min(pos(:,3))-50;
zaM=max(pos(:,3))+50;
N=numel(pos(:,3));
clustm=min(cl);
if clustm==0
    clustm=1;
end
clustM=max(cl);
%plot3(pos(:,1),pos(:,2),pos(:,3),'.b','Markersize',1,'markerfacecolor','b'); 
%hold on
for i=clustm:clustM
        en=find(cl==i);
        xcl=pos(en,1);
        ycl=pos(en,2);
        zcl=pos(en,3);
        plotbox3(xcl,ycl,zcl,'r');
        hold on
        plot3(xcl,ycl,zcl,'ob','Markersize',0.5,'markerfacecolor','b'); 
        hold on
        plot3(c_prim(i,1),c_prim(i,2),c_prim(i,3),'ow','markerfacecolor','w','markersize',3)
end
hold on
plotbox3(pos(:,1),pos(:,2),[0,0]',0)
zlim([zam;zaM])
xlim([min(pos(:,1)),max(pos(:,1))])
ylim([min(pos(:,2)),max(pos(:,2))])
%axis image
view(3)
title([exname1,': \newline Primary cluster ',num2str(clustM),' and centroids '])    

%subplot(2,1,2)
subplot('Position',[0.507, 0.11, 0.49, 0.8])
pos =pos2;
cl=cl2;
c_prim=c_primar2;

zam=min(pos(:,3))-50;
zaM=max(pos(:,3))+50;
N=numel(pos(:,3));
clustm=min(cl);
if clustm==0
    clustm=1;
end
clustM=max(cl);
%plot3(pos(:,1),pos(:,2),pos(:,3),'.b','Markersize',1,'markerfacecolor','b'); 
hold on
for i=clustm:clustM
        en=find(cl==i);
        xcl=pos(en,1);
        ycl=pos(en,2);
        zcl=pos(en,3);
        plotbox3(xcl,ycl,zcl,'r');
        hold on
        plot3(xcl,ycl,zcl,'ob','Markersize',0.5,'markerfacecolor','b'); 
        hold on
        plot3(c_prim(i,1),c_prim(i,2),c_prim(i,3),'ow','markerfacecolor','w','markersize',3)
end
hold on
plotbox3(pos(:,1),pos(:,2),[0,0]',0)
zlim([zam;zaM])
%axis image
xlim([min(pos(:,1)),max(pos(:,1))])
ylim([min(pos(:,2)),max(pos(:,2))])
view(3)
title([exname2,'; \newline Primary cluster ',num2str(clustM),' and centroids '])    
suptitle(['Primary cluster and main centroids. Blue - points in cluster \newline Radius = ',...
    num2str(RRmax),' nm'])
       
    

clear('scrsz','c_prim','cl','pos','clustm','clustM','pos1','pos2','en','i')
clear('zam', 'zaM' , 'xcl' ,'ycl' , 'zcl')


