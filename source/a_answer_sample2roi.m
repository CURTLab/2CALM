options.Interpreter = 'tex';
options.Default = 'New sample';

button = questdlg('\fontsize{12}Do you want to regionalize the loaded samples or load a new sample',...
    'ROI','Sample 1','Sample 2','New sample',options);
switch button
    case 'Sample 1'
      clc
      if exist('dat1','var')==0 || isempty(dat1)==1
       helpdlg('Sample 1 do not exists','message')   
       A_start;
      end
      dat=dat1;
      colhead=colhead1;
      fullpath=fullpath1;
      exname=exname1;
      xi=xi1;
      zi=zi1;
      yi=yi1;
      rgi=rgi1;
      rgfi=rgfi1;
      rgsi=rgsi1;
      dirname=dirname1;
      plot_original_data_12d(dat1(:,xi1),dat1(:,yi1),dat1(:,zi1),exname1);
      clear('button')
      quit cancel;
     
    case 'Sample 2'
      clc
      if exist('dat2','var')==0 || isempty(dat2)==1
       helpdlg('Sample 2 do not exists','message')   
       A_start;
      end
      dat=dat2;
      colhead=colhead2;
      fullpath=fullpath2;
      exname=exname2;
      xi=xi2;
      zi=zi2;
      yi=yi2;
      rgi=rgi2;
      rgfi=rgfi2;
      rgsi=rgsi2;
      dirname=dirname2;
      plot_original_data_12d(dat2(:,xi2),dat2(:,yi2),dat(:,zi2),exname2);
      clear('button')
      quit cancel;
      
    case 'New sample'
      clc
try
      ROI_Load;
catch
      
        helpdlg('Calculations had been aborted','load message')
        A_start;
end
      clear('button')
      quit cancel;
   
end