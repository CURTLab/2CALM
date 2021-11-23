

clc
scrsz = get(0,'ScreenSize');
zz1=ddat1(:,zi);
zz2=ddat2(:,zi);


figure ('OuterPosition', [scrsz(3)/4.9 scrsz(4)/10 scrsz(4)/0.72 scrsz(4)/1.25]) ;
whitebg('k');

subplot('Position',[0.04, 0.11, 0.45, 0.8])
eppn=find(zz1(:,1)<0);
eppp=find(zz1(:,1)>=0);
whitebg('k')

plot(ddat1(eppn,xi),ddat1(eppn,yi),'.b','markersize',1)
hold on
plot(ddat1(eppp,xi),ddat1(eppp,yi),'.y','markersize',1)

xlim([min(ddat1(:,xi)),max(ddat1(:,xi))])
ylim([min(ddat1(:,yi)),max(ddat1(:,yi))])
xlabel('nm','color','k')
ylabel('nm','color','k')
title(['{\bfRANDOM }',exname],'Fontsize',9,'FontWeight','normal','color','m')


subplot('Position',[0.53, 0.11, 0.45, 0.8])
eppn=find(zz2(:,1)<0);
eppp=find(zz2(:,1)>=0);
whitebg('k')
 plot(ddat2(eppn,xi),ddat2(eppn,yi),'.b','markersize',1)
 hold on
 plot(ddat2(eppp,xi),ddat2(eppp,yi),'.y','markersize',1)

 xlim([min(ddat2(:,xi)),max(ddat2(:,xi))])
 ylim([min(ddat2(:,yi)),max(ddat2(:,yi))])
xlabel('nm','color','k')
ylabel('nm','color','k')
title(exname,'Fontsize',9,'FontWeight','normal','color','m')
suptitle(['Randomized data. XY view: Yellow-positiv z, Blue-negativ z. Random= ',...
    num2str(NN1),' Sample= ',num2str(NN2),' points'])


clear('scrsz','eppp','eppn','zz1','zz2','ddat1','ddat2','exmane','NN1','NN2')