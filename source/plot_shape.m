
if exist('dat2','var')==1


scrsz = get(0,'ScreenSize');



figure ('OuterPosition', [scrsz(3)/6 scrsz(4)/10 scrsz(4)/0.8 scrsz(4)/1.25]) ;
whitebg('k');

subplot('Position',[0.04, 0.11, 0.45, 0.8])

do1=[dat1(:,xi1),dat1(:,yi1),dat1(:,zi1)];
cen1=mean(do1);
[~,v] = convhulln(do1);
lambda11=N1/v;
v=v/1e+9;
 
v=round(v,2);
plot3(dat1(:,xi1),dat1(:,yi1),dat1(:,zi1),'ob','markerfacecolor','w','markersize',1)
hold on

shp = alphaShape(do1,'HoleThreshold',10);
alphaspec = alphaSpectrum(shp);
a=mean(alphaspec);
a=min(500,a);

%a = criticalAlpha(shp,'all-points');
%a=a/5;
shp.Alpha = a;
plot(shp,'FaceAlpha',0.5)
 grid on
 %plot3(cen1(:,1),cen1(:,2),cen1(:,3),'ok','markerfacecolor','k','markersize',10)

 %axis image
 view(2)


xlim([min(dat1(:,xi1)),max(dat1(:,xi1))])
ylim([min(dat1(:,yi1)),max(dat1(:,yi1))])

line([min(dat1(:,xi1))+100,min(dat1(:,xi1))+1100],[min(dat1(:,yi1))+100,min(dat1(:,yi1))+100],'color','r','LineWidth',4)
xlabel('nm (red line 1 \mum)','color','w')
ylabel('nm','color','w')
title(['{\it S1}: Density ', num2str(lambda11),' 1/nm^3 ',' (',num2str(N1),' pt. Vol: ',num2str(v),'\mum^3)' ],'Fontsize',9,'FontWeight','normal','color','w')


subplot('Position',[0.535, 0.11, 0.44, 0.8])
whitebg('k')
 do2=[dat2(:,xi2),dat2(:,yi2),dat2(:,zi2)];
 cen2=mean(do2);
 [~,v] = convhulln(do2);
 lambda22=N2/v;
 v=v/1e+9;
 
 v=round(v,2);
 
 plot3(dat2(:,xi2),dat2(:,yi2),dat2(:,zi2),'or','markerfacecolor','w','markersize',1)
 hold on
 shp = alphaShape(do2,'HoleThreshold',30);
 alphaspec = alphaSpectrum(shp);
 a=mean(alphaspec);
a=min(500,a);
% a = criticalAlpha(shp,'all-points');
%a=a/5;
shp.Alpha = a;

 plot(shp,'FaceAlpha',0.5)
 grid on
% plot3(cen2(:,1),cen2(:,2),cen2(:,3),'ok','markerfacecolor','k','markersize',10)
 %axis image
 view(2)
 
 
 
 line([min(dat2(:,xi1))+100,min(dat2(:,xi1))+1100],[min(dat2(:,yi1))+100,min(dat2(:,yi1))+100],'color','r','LineWidth',4)
 xlim([min(dat2(:,xi2)),max(dat2(:,xi2))])
 ylim([min(dat2(:,yi2)),max(dat2(:,yi2))])
 xlabel('nm (red line 1 \mum)','color','w')
 ylabel('nm','color','w')
title(['{\it S2}: Density ', num2str(lambda22),' 1/nm^3 ',' (',num2str(N2),' pt. Vol: ',num2str(v),'\mum^3)' ],'Fontsize',9,'FontWeight','normal','color','w')


suptitle(['Shape of data taken to comparison.',...
    '\newline Sample1: ',exname1,' (',num2str(N1),') points',...
    '\newline Sample2: ',exname2 ,' (',num2str(N2),')  points'])

else
  
    disp(' ');
    disp('Sample 2 do not exists. Please load data of sample 2');
    a_info_load;
end
clc
clear('scrsz','shp','eppn','do1','do2')