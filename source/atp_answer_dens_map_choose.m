close all

button = questdlg('Density map of individual samples',...
    'DMAP','Sample 1','Sample 2','Sample 1');
switch button
    case 'Sample 1'
       clc
        Imax=400;
        exname=exname1;
        pos=posprim1;
        larg1=largp1;
        clas1=cl1;
        larg2=larg1standard;
        clas2=kt1rys;
       atp_dens_map;
      clear('button')
      quit cancel;
     
    case 'Sample 2'
      clc
        Imax=400;
        exname=exname2;
        pos=posprim2;
        larg1=largp2;
        clas1=cl2;
        larg2=larg2standard;
        clas2=kt2rys;
        atp_dens_map;
      clear('button')
      quit cancel;
    
end