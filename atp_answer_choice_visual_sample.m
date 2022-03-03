
button = questdlg('3D primary cluster of individual samples or both',...
    'Primary','Sample 1','Sample 2','Both','Both');
switch button
    case 'Sample 1'
       clc
        pos=posprim1;
        cl=cl1;
        largp=largp1;
        exname=exname1;
        radius=RRmax;
        atp_plot_trian_sampe;
      clear('button')
      quit cancel;
     
    case 'Sample 2'
      clc
        pos=posprim2;
        cl=cl2;
        largp=largp2;
        exname=exname2;
        radius=RRmax;
        atp_plot_trian_sampe;
      clear('button')
      quit cancel;
      
    case 'Both'
      clc
      tt_visual_both;
      clear('button');
      quit cancel;
   
end