close all
atr_prim_dat_check;
clc
tic
Rsize=R_standard;
larg1standard=sortrows(larg1standard,1,'descend');
larg2standard=sortrows(larg2standard,1,'descend');

uu1=find(larg1standard(:,1)<=4,1,'first')-1;
if isempty(uu1)==1
    uu1=round(numel(larg1standard(:,1))/2);
end

uu2=find(larg2standard(:,1)<=4,1,'first')-1;
if isempty(uu2)==1
    uu2=round(numel(larg2standard(:,1))/2);
end
uu=min(uu1,uu2);
uu=min(200,uu);
kk=uu+1;
umax=max(kt1rys);
del=1/umax;
col=0.0:del:1;
uwg=exp(-0.8*col);
uwr=exp(-5*col);
col=normi(uwg);
col=0.6*col+0.3;
colr=normi(uwr);
colr=0.8*colr+0.1;
col1=col;
colr1=colr;

umax=max(kt2rys);
del=1/umax;
col=0.0:del:1;
uwg=exp(-0.8*col);
uwr=exp(-5*col);
col=normi(uwg);
col=0.6*col+0.3;
colr=normi(uwr);
colr=0.8*colr+0.1;
col2=col;
colr2=colr;

clear('col','umax','del','uwg','uwr', 'colr')

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
scrsz = get(0,'ScreenSize');
clear('hfg')
hfg1=figure(989);
set(hfg1, 'Position', [scrsz(3)/5 scrsz(4)/9 scrsz(4)/0.71 scrsz(4)/1.26])
whitebg('k')
subplot(1,2,1)
whitebg('k')
hold on
plot3(posprim1(:,1),posprim1(:,2),posprim1(:,3),'.','markerfacecolor','b','markeredgecolor','b','markersize',0.5)
grid on
hold on
%cst1=larg1standard(kk:end,5:7);
%plot3(cst1(:,1),cst1(:,2),cst1(:,3),'.r','markersize',4);
title([num2str(uu),'/',num2str(max(kt1rys)), ' largest clusters of sample 1'])
subplot(1,2,2)
whitebg('k')
hold on
plot3(posprim2(:,1),posprim2(:,2),posprim2(:,3),'.','markerfacecolor','b','markeredgecolor','b','markersize',0.5)
grid on
hold on
%cst2=larg21standard(kk:end,5:7);
% plot3(cst2(:,1),cst2(:,2),cst2(:,3),'.r');
 
title([num2str(uu),'/',num2str(max(kt2rys)), ' largest clusters of sample 2'])

hold on
btn = uicontrol('Style', 'pushbutton', 'String', 'STOP',...
     'Position', [20 20 100 30],...
'Callback', 'i=-10000;');
clear('i','btn')

try

for i=1:uu
  
clear('dd00','dd11')   
eo=find(kt1rys==larg1standard(i,2));
dd00=posprim1(eo,:);
e1=find(kt2rys==larg2standard(i,2));
dd11=posprim2(e1,:);

figure (989)
pause(0.01)
subplot(1,2,1)
plot3(dd00(:,1),dd00(:,2),dd00(:,3),'ok','markerfacecolor',[colr1(i),col1(i),0.1],...
    'markersize',3, 'markeredgecolor',[colr1(i),col1(i),0.1])

 shp = alphaShape(dd00);
 plot(shp,'FaceAlpha',0.6,'facecolor','g')
%axis image 
title([num2str(i),'/',num2str(max(kt1rys)), ' largest clusters of sample 1'])

subplot(1,2,2)

plot3(dd11(:,1),dd11(:,2),dd11(:,3),'ok','markerfacecolor',[colr2(i),col2(i),0.1],...
    'markersize',3, 'markeredgecolor',[colr2(i),col2(i),0.1])
hold on
 shp = alphaShape(dd11);
 plot(shp,'FaceAlpha',0.6, 'facecolor','g')
 %axis image
 title([num2str(i),'/',num2str(max(kt2rys)), ' largest clusters of sample 2'])

end

 suptitle(['Hierar. clustering : Max cluster size = ',num2str(Rsize),' nm (for 3D visualization, the cluster must have at least 4 non-colinear points) \newline',...
         'First largest ',num2str(uu),' clusters: ', exname1,' and ',exname2])
 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% rest centroids %%%%%%%%%%%%%%%%%%   
 
 
 
 catch
    atp_stop_iteration;
end      
       
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%       
  clear('eo','dd00','e1','dd11','shp','Rsize')
  clear('cols', 'ii','i', 'scrsz','uu1','uu2','uu')      
  clear('eo','dd00','e1','dd11','shp','hfg1')
   clear('col1', 'dd','i', 'kk','pos1' ,'pos2','scrsz','uu','col2','colr1','colr2')
toc