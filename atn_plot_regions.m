





cregion=[];
scrsz = get(0,'ScreenSize');
figure (111)
set(gcf,'OuterPosition', [scrsz(3)/6.8 scrsz(4)/14 scrsz(4)/0.7 scrsz(4)/1.25]) ;
whitebg('k');

%subplot(1,2,1)

subplot('Position',[0.01, 0.11, 0.49, 0.8])
whitebg('k')
plot(pos(:,1),pos(:,2),'.y','markerfacecolor','y','markersize',1)
hold on
        
        xcl=pos(:,1);
        ycl=pos(:,2);
        zcl=pos(:,3);
        cregion(1,1)=mean(xcl);
        cregion(1,2)=mean(ycl);
        cregion(1,3)=mean(zcl);
        hold on
        %plot(cregion(1,1),cregion(1,2),'ow','markerfacecolor','w','markersize',3)
       
xlim([min(pos(:,1)),max(pos(:,1))+1])
ylim([min(pos(:,2)),max(pos(:,2))+1])
axis image
title(['\fontsize{10} ROI Nr: ',num2str(reg_id),'\newline Number of points ',num2str(N_n) ],'FontWeight','normal')        

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%subplot(1,2,2)
subplot('Position',[0.501, 0.11, 0.49, 0.8])

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
whitebg('k')
clustm=min(cl_n);
if clustm==0
    clustm=1;
end
clustM=max(cl_n);
whitebg('k')

plot(pos_all(:,1),pos_all(:,2),'.b','markerfacecolor','b','markersize',1)
        hold on

        xcl=pos(:,1);
        ycl=pos(:,2);
        zcl=pos(:,3);
        
         hold on
        
         plot(xcl,ycl,'.y','Markersize',2,'markerfacecolor','y'); 
         hold on
         plotbox2(xcl,ycl,'w')
        

xlim([min(pos(:,1)),max(pos(:,1))+1])
ylim([min(pos(:,2)),max(pos(:,2))+1])
axis image
title(['\fontsize{10} Full data set. ROI Nr: ',num2str(reg_id),'\newline Number of points ',num2str(N_n) ],'FontWeight','normal')        



suptitle(['\fontsize{12} Sample1: ',exname])  
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clear('scrsz','cregion')

