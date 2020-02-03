


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% data input 

sort_typ=1;
%%% sort_typ = 0 density sort, sort_typ= 1 large/intensity sort

clc
if sort_typ==0
    largp =sortrows(largp,3,'descend');
else
    largp =sortrows(largp,1,'descend');
end

xx=pos(:,1);
yy=pos(:,2);
zz=pos(:,3);
xm = min(xx);
xM=max(xx);
ym=min(yy);
yM=max(yy);
%ep=find(cl==0);
%rest_pos=pos(ep,:);
%%%%%%%%%%%%%%%%%%%%%%% colors %%%%%%%%%%%%%%%%%%%%%%%%
rng('default')
%%%%%%%%%%%%%%%%%%%%%%%%% color preparation
umax=max(cl);
del=1/umax;
col=0.0:del:1;
uwg=exp(-0.8*col);
uwr=exp(-5*col);
col=normi(uwg);
col=0.6*col+0.3;
colr=normi(uwr);
colr=0.8*colr+0.1;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

scrsz = get(0,'ScreenSize');

hfg=figure(1000);
set(hfg, 'OuterPosition', [scrsz(3)/4 scrsz(4)/15 scrsz(3)*0.523 scrsz(4)*0.93])
set(hfg,'WindowStyle', 'normal', ...  %%%'normal'
                  'Visible'     ,'on', ...
                  'NumberTitle' ,'off', ...
                  'Name'        ,'SINGLE', ...
                  'Resize'      ,'on', ...
                  'Colormap'    ,[], ...
                  'MenuBar'     ,'figure',...
                  'ToolBar' 	,'figure')
whitebg('k')
subplot('Position',[0.06, 0.06, 0.9, 0.87])
plotbox3(xx,yy,zz,'r')
hold on
plot3(pos(:,1),pos(:,2),pos(:,3),'.b','markerfacecolor','b','markersize',1)


view(2);

%axis image
grid on
hold on
%xlim([min(pos(:,1)),max(pos(:,1))])
%ylim([min(pos(:,2)),max(pos(:,2))])
%zlim([min(pos(:,3)),max(pos(:,3))])
umax=max(cl);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
uu=min(umax,200);

%kk=uu+1;
%cst1=largp(kk:end,5:7);
%plot3(cst1(:,1),cst1(:,2),cst1(:,3),'or','markersize',4);


hold on
btn = uicontrol('Style', 'pushbutton', 'String', 'STOP',...
     'Position', [20 20 100 30],...
'Callback', 'i=-100;');
clear('i','btn')

try


for i=1:uu
pause(0.01)   
   if i>1 
   delete(h0);
   end
    h0=text(xm+0.01*(xM-xm),ym+0.02*(yM-ym),['Cluster ', num2str(i)],'color','r','fontsize', 12);
   if i==uu
    delete(h0);
   end   
eo=find(cl==largp(i,2));
dd00=[];
dd00=pos(eo,:);


figure (1000)

pause(0.00)
plot3(dd00(:,1),dd00(:,2),dd00(:,3),'ok','markerfacecolor',[colr(i),col(i),0.1],...
    'markersize',2, 'markeredgecolor',[colr(i),col(i),0.1])
hold on
 shp = alphaShape(dd00);
 plot(shp,'FaceAlpha',0.6)

 title([num2str(uu),'/',num2str(umax), ' largest primary clusters. Cluster size ',num2str(radius), 'nm. \newlineSample: ',exname])

axis image 


end
text(xm+0.01*(xM-xm),ym+0.02*(yM-ym), 'Finish','color','r','fontsize', 12)

catch
    atp_stop_iteration;
end

%suptitle(['Primary cluster for ',num2str(RRmax),' nm  radius  \newline',...
   %   exname])

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%       
   clear('hfg','eo','dd00','e1','dd11','shp','ep','del','cl','h0','exname')
   clear('col','colr', 'dd','i', 'kk','pos' ,'scrsz' ,'largp', 'radius', 'rest_pos',...
        'umax' ,'uu' ,'uwg', 'uwr', 'xx' ,'yy', 'zz', 'xm', 'xM', 'ym', 'yM','sort_typ')
   