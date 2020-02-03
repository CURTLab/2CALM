atr_prim_dat_check;
clc
pos1=posprim1;
pos2=posprim2;


scrsz = get(0,'ScreenSize');
figure ('OuterPosition', [scrsz(3)/4.7 scrsz(4)/10 scrsz(4)/0.8 scrsz(4)/1.25]) ;
whitebg('k');

%subplot(2,1,1)
subplot('Position',[0.04, 0.11, 0.45, 0.8])
pos =pos1;
cl=cl1;
c_prim=c_pri1;

N=numel(pos(:,1));
clustm=min(cl);
if clustm==0
    clustm=1;
end
clustM=max(cl);
plot(pos(:,1),pos(:,2),'.r','Markersize',0.5,'markerfacecolor','r'); 
hold on
for i=clustm:clustM
        en=find(cl==i);
        xcl=pos(en,1);
        ycl=pos(en,2);
        
        plotbox2(xcl,ycl,'r');
        hold on
        plot(xcl,ycl,'.b','Markersize',2,'markerfacecolor','b'); 
        hold on
end     
hold on
plot(c_prim(:,1),c_prim(:,2),'ow','markerfacecolor','w','markersize',1)

xlim([min(pos(:,1)),max(pos(:,1))])
ylim([min(pos(:,2)),max(pos(:,2))])
%axis image

title([exname1,': \newline Primary cluster ',num2str(clustM),' and centroids and subcentroids '])    
clear('pos')


%subplot(2,1,2)
subplot('Position',[0.535, 0.11, 0.44, 0.8])
pos =pos2;
cl=cl2;
c_prim=c_pri2;
N=numel(pos(:,1));
clustm=min(cl);
if clustm==0
    clustm=1;
end
clustM=max(cl);
plot(pos(:,1),pos(:,2),'.r','Markersize',1,'markerfacecolor','r'); 
hold on

for i=clustm:clustM
        en=find(cl==i);
         hold on
        xcl=pos(en,1);
        ycl=pos(en,2);
        plot(xcl,ycl,'.b','Markersize',2,'markerfacecolor','b'); 
        hold on
        plotbox2(xcl,ycl,'r');
        hold on
       
end

plot(c_prim(:,1),c_prim(:,2),'ow','markerfacecolor','w','markersize',1)
%axis image
xlim([min(pos(:,1)),max(pos(:,1))])
ylim([min(pos(:,2)),max(pos(:,2))])

title([exname2,'; \newline Primary cluster ',num2str(clustM),' and centroids and subcentroids'])    
suptitle(['Primary clluster: Blue - points in cluster, Red - points outside cluster, White - centroids and subcentroids \newline Radius = ',...
    num2str(RRmax),' nm'])

clear('scrsz','c_prim','cl','pos','clustm','clustM','pos1','pos2','en', 'i' ,'xcl' ,'ycl')
