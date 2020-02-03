function atn_plot2d_region(pos,cl,c_prim,N_region)
 
%%%%%% 
disp('____  Plot Regions _______')


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% plots %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
lim_region=mean(N_region(:,2));
clustm=min(cl);
if clustm==0
    clustm=1;
end
clustM=max(cl);

scrsz = get(0,'ScreenSize');
figure
set(gcf,'OuterPosition', [scrsz(3)/17 scrsz(4)/19 scrsz(4)/0.7 scrsz(4)/1.05]) ;

whitebg('k')

plot(pos(:,1),pos(:,2),'.b','markerfacecolor','b','markersize',1)
hold on

for i=clustm:clustM
        en=find(cl==i);
        ai=find(N_region(:,1)==i);
        xcl=pos(en,1);
        ycl=pos(en,2);
        plot(c_prim(:,1),c_prim(:,2),'or','markerfacecolor','r','markersize',0.5)
        hold on
        if N_region(ai,2)>=lim_region
             plot(xcl,ycl,'.y','Markersize',2,'markerfacecolor','y'); 
             hold on
             plotbox2(xcl,ycl,'w')
        else
             plot(xcl,ycl,'.g','Markersize',2,'markerfacecolor','y');
             plotbox2(xcl,ycl,'g')
             hold on
        end
end




axis image
title(['Number of regions ',num2str(clustM),' White - dense regions green - small regions '])    




 
end
