function plot_original_data_12d(x,y,z,exname)

scrsz = get(0,'ScreenSize');
figure ('OuterPosition', [scrsz(3)/6.4 scrsz(4)/30 scrsz(4)/0.80 scrsz(4)/1.1]) ;

whitebg('k')


eppn=find(z(:,1)<0);
hold on
plot(x(eppn,1),y(eppn,1),'.b','Markersize',1)
hold on
eppp=find(z(:,1)>=0);
plot(x(eppp,1),y(eppp,1),'.y','Markersize',0.5)
axis image
title ([exname,'\newline Number of points = ',num2str(numel(x))]);
