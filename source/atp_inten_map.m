clc;
disp('Voronoi calculation. Please wait')

atr_prim_dat_check;

tic

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
scrsz = get(0,'ScreenSize');
figure ('OuterPosition', [scrsz(3)/4.7 scrsz(4)/10 scrsz(4)/0.8 scrsz(4)/1.25]) ;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
subplot('Position',[0.04, 0.11, 0.44, 0.8])
whitebg('k');

primar=0;
larg=larg1;
tra=transfLin(larg,1);
[v,c,xm,xM,ym,yM]= Int_map_Vor(0,cent1,[]);

for i = 1:length(c)
    if primar==1
        mei=subcentroid(i,4);
        ee=find(larg(:,2)==mei);
        de=larg(ee,1);
        us=find(tra(:,1)==de,1,'first');
        zu=tra(us,2);
        color=[zu,zu,1-zu]*zu;
    else
        ee=find(larg(:,2)==i);   
        de=larg(ee,1);   
        us=find(tra(:,1)==de,1,'first');
        zu=tra(us,2);
        color=[zu,zu,0.2]*zu;
    end    
     if de>2       
    patch(v(c{i},1),v(c{i},2),color,'edgecolor','none') ;
     end
    hold on
end
xlim([xm,xM])
ylim([ym,yM])

title(['Intensity map based on standard clustering. Dimension ',num2str(R_standard),' nm'],'Fontsize',10,'FontWeight','normal','color','y')
clear('v','c')


 

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
subplot('Position',[0.535, 0.11, 0.44, 0.8])
whitebg('k');
primar=1;
larg=larg2;
tra=transfLin(larg,1);
[v,c]= Int_map_Vor(1,cent2,subcentroid);

for i = 1:length(c)
    if primar==1
        mei=subcentroid(i,4);
        ee=find(larg(:,2)==mei);
        de=larg(ee,1);
        us=find(tra(:,1)==de,1,'first');
        zu=tra(us,2);
        color=[zu,zu,1-zu]*zu;
    else
        ee=find(larg(:,2)==i);   
        de=larg(ee,1);   
        us=find(tra(:,1)==de,1,'first');
        zu=tra(us,2);
        color=[zu,zu,0.2]*zu;
    end    
    if de>5  
    patch(v(c{i},1),v(c{i},2),color,'edgecolor','r') ;
    end
    hold on
end
xlim([xm,xM])
ylim([ym,yM])


title(['Intensity map based on primary clustering. Radius ',num2str(RRmax),' nm'],'Fontsize',10,'FontWeight','normal','color','y')



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



suptitle(['Clustering based intensity maps.\newlineSample= ',exname])
toc

clear('scrsz','c','v', 'color','de','ee', 'exname', 'i' ,'larg' ,'mei' , 'primar', 'subcentroid',...
'tra', 'us' ,'xm' ,'xM' ,'ym', 'yM', 'zu', 'cent1', 'cent2', 'larg1', 'larg2')