
button = questdlg('3D standard cluster of individual samples or both',...
    'Primary','Sample 1','Sample 2','Both','Both');
switch button
    case 'Sample 1'
       clc
        pos=posprim1;
        cl=kt1rys;
        largp=larg1standard;
        exname=exname1;
        radius=R_standard;
       atr_visual_standard_sample_single;
      clear('button')
      quit cancel;
     
    case 'Sample 2'
      clc
         pos=posprim2;
        cl=kt2rys;
        largp=larg2standard;
        exname=exname2;
        radius=R_standard;
       atr_visual_standard_sample_single;
      clear('button')
      quit cancel;
      
    case 'Both'
      clc
      tt_visual_standard_white;
      clear('button');
      quit cancel;
   
end