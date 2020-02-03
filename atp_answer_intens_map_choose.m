close all

button = questdlg('Intensity map of individual samples',...
    'IMAP','Sample 1','Sample 2','Sample 1');
switch button
    case 'Sample 1'
       clc
        exname=exname1;
        larg1=larg1standard;
        cent1=c1standard;
        larg2=largp1;
        subcentroid=c_pri1;
        cent2=c_primar1;
      atp_inten_map;
      clear('button')
      quit cancel;
     
    case 'Sample 2'
      clc
        exname=exname2;
        larg1=larg2standard;
        cent1=c2standard;
        larg2=largp2;
        subcentroid=c_pri2;
        cent2=c_primar2;
      atp_inten_map;
      clear('button')
      quit cancel;
    
end