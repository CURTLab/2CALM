

close all
atr_prim_dat_check;
clc
pos1=posprim1;
pos2=posprim2;

%%%%%%%%%%%%%%%%%%%%%%% colors %%%%%%%%%%%%%%%%%%%%%%%%
umax=max(cl1);
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

umax=max(cl2);
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
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
scrsz = get(0,'ScreenSize');

hfg=figure(1000);
set(hfg, 'Position', [scrsz(3)/5 scrsz(4)/9 scrsz(4)/0.71 scrsz(4)/1.26])
uu=max(max(cl1),max(cl2));




whitebg('k')
subplot(1,2,1)
whitebg('k')
view(2)
hold on
plot3(pos1(:,1),pos1(:,2),pos1(:,3),'.b','markerfacecolor','b','markersize',1)
grid on
hold on


subplot(1,2,2)
whitebg('k')
hold on
plot3(pos2(:,1),pos2(:,2),pos2(:,3),'.b','markerfacecolor','b','markersize',1)
grid on
hold on
btn = uicontrol('Style', 'pushbutton', 'String', 'STOP',...
     'Position', [20 20 100 30],...
'Callback', 'i=uu+10000;');
clear('i','btn')
try
for i=1:uu
pause(0.001)     

if i<= max(cl1)  
    pause(0.0001) 
eo=find(cl1==largp1(i,2));
dd00=pos1(eo,:);
figure (1000)
pause(0.01)
subplot(1,2,1)
view(2) 
plot3(dd00(:,1),dd00(:,2),dd00(:,3),'ok','markerfacecolor',[colr1(i),col1(i),0.1],...
    'markersize',1, 'markeredgecolor',[colr1(i),col1(i),0.1])
hold on
 shp = alphaShape(dd00);
 plot(shp,'FaceAlpha',0.5)
%axis image 
title([num2str(i),'/',num2str(max(cl1)), ' largest primary clusters of sample 1'])

end

if i<= max(cl2) 
  pause(0.0001) 
e1=find(cl2==largp2(i,2));
dd11=pos2(e1,:);
subplot(1,2,2)
view(2)
plot3(dd11(:,1),dd11(:,2),dd11(:,3),'ok','markerfacecolor',[colr2(i),col2(i),0.1],...
    'markersize',2, 'markeredgecolor',[colr2(i),col2(i),0.1])
hold on
 shp = alphaShape(dd11);
 plot(shp,'FaceAlpha',0.5)
 
 
 title([num2str(i),'/',num2str(max(cl2)), ' largest primary clusters of sample 2'])
 

 
% axis image

end



 

end

 suptitle(['Primary cluster for radius ',num2str(RRmax),' nm    \newline',...
           exname1,' and ',exname2])
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%       

catch
    atp_stop_iteration;
end
   
       
   clear('eo','dd00','e1','dd11','shp','hfg')
   clear('col1', 'dd','i', 'kk','pos1' ,'pos2','scrsz','uu','col2','colr1','colr2')
   
   