
atr_prim_dat_check;



if exist('RRmax','var')==1 && exist('R_standard','var')

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
scrsz = get(0,'ScreenSize');
figure ('OuterPosition', [scrsz(3)/4.7 scrsz(4)/10 scrsz(4)/0.8 scrsz(4)/1.25]) ;
subplot('Position',[0.535, 0.11, 0.44, 0.8])

whitebg('k');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
dens_map_prim=Dmap_n(Imax,pos,larg1,clas1);
imshow(dens_map_prim)
title(['Density map based on primary clustering. Radius ',num2str(RRmax),' nm'],'Fontsize',10,'FontWeight','normal','color','y')


subplot('Position',[0.04, 0.11, 0.45, 0.8])
whitebg('k')
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
dens_map_standard=Dmap_n(Imax,pos,larg2,clas2);
imshow(dens_map_standard)
title(['Density map based on standard clustering. Dimension ',num2str(R_standard),' nm'],'Fontsize',10,'FontWeight','normal','color','y')
suptitle(['Clustering based density maps.\newlineSample= ',exname])

clear('scrsz', 'cl', 'exname' , 'Imax' ,'larg1' , 'pos', 'clas1' ,'clas2' , 'larg2', 'larg')

else
    msgbox('Clusters do not exist. Please perform clustering')
    clc
    A_start;
end

