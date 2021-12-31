


    fullpath=Bmds.Files{is,1};
    load(fullpath)
    
     pathname=[extractAfter(fullpath,endtext)];
     va=extractBefore(pathname,'_');
     vb=extractAfter(fullpath,'_ORG\');
     vb=extractBefore(vb,'_');
     exname=[vb,'-',va];
     clear('va','vb')
    
    %yos(iw,1)={exname1};
    if exist('par','var') == 1
     colhead=par.pkdesc.desc';
     dat=par.pkmatrix;
     [xi,yi,zi,~,~,~,~,~,~,~,~]=data_extraction_index(colhead1);
     clear('par');
    else
     clear
     a_info_wrong_data;
     stop_wrong_data;
    end
    do=[dat(:,xi),dat(:,yi),dat(:,zi)];
    plot3(dat(:,xi),dat(:,yi),dat(:,zi),'ok','markerfacecolor','k','markersize',2)
    hold on
    shp = alphaShape(do,150);
    plot(shp,'FaceAlpha',0.6)
    grid on
    view(2)


xlim([min(dat(:,xi)),max(dat(:,xi))])
ylim([min(dat(:,yi)),max(dat(:,yi))])
title(['s1 ',exname])
clear('do','dat','shp','exname','pathname')