

clc
scrsz = get(0,'ScreenSize');
zz1=ddat1(:,zi1);
zz2=ddat2(:,zi2);


figure ('OuterPosition', [scrsz(3)/4.9 scrsz(4)/10 scrsz(4)/0.72 scrsz(4)/1.25]) ;
whitebg('k');

subplot('Position',[0.04, 0.11, 0.45, 0.8])
eppn=find(zz1(:,1)<0);
eppp=find(zz1(:,1)>=0);
whitebg('k')

plot(ddat1(eppn,xi1),ddat1(eppn,yi1),'.b','markersize',1)
hold on
plot(ddat1(eppp,xi1),ddat1(eppp,yi1),'.y','markersize',1)

xlim([min(ddat1(:,xi1)),max(ddat1(:,xi1))])
ylim([min(ddat1(:,yi1)),max(ddat1(:,yi1))])
xlabel('nm','color','k')
ylabel('nm','color','k')
title(['{\bfRANDOM }',exname],'Fontsize',9,'FontWeight','normal','color','m')


subplot('Position',[0.53, 0.11, 0.45, 0.8])
eppn=find(zz2(:,1)<0);
eppp=find(zz2(:,1)>=0);
whitebg('k')
 plot(ddat2(eppn,xi2),ddat2(eppn,yi2),'.b','markersize',1)
 hold on
 plot(ddat2(eppp,xi2),ddat2(eppp,yi2),'.y','markersize',1)

 xlim([min(ddat2(:,xi2)),max(ddat2(:,xi2))])
 ylim([min(ddat2(:,yi2)),max(ddat2(:,yi2))])
xlabel('nm','color','k')
ylabel('nm','color','k')
title(exname,'Fontsize',9,'FontWeight','normal','color','m')
suptitle(['Randomized data. XY view: Yellow-positiv z, Blue-negativ z. Random= ',...
    num2str(NN1),' Sample= ',num2str(NN2),' points'])


clear('scrsz','eppp','eppn','zz1','zz2','ddat1','ddat2','exmane','NN1','NN2')