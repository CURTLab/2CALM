try 
     if exist('dat1','var')==0 || exist('dat1','var')==0
         helpdlg('Data do not exist. Load or Reload data')
         stop_missing_data    %%%%%%%%%%%%%% stop
     else    
         if isempty(dat1)==1 ||  isempty(dat2)==1
         helpdlg('Data are empty. Load or Reload data')
         stop_missing_data    %%%%%%%%%%%%%% stop 
         end
     end
catch
     clc
     clear
     A_start;
 end
    

