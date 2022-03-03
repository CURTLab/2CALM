 try 
 if exist('dat1','var')==0 || exist('dat1','var')==0
     helpdlg('Data do not exist. Load or Reload data')
    stop_missing_data    %%%%%%%%%%%%%% stop
 else    
     if isempty(dat1)==1 ||  isempty(dat2)==1
     helpdlg('Data are empty. Load or Reload data')
     stop_missing_data    %%%%%%%%%%%%%% stop
     else
     if exist('PK_Array1','var')==0 
      helpdlg('Bootstrapped Ripley analysis is not carried out. Run analisis')
      stop_missing_data    %%%%%%%%%%%%%% stop
     end
     if exist('KD_Array','var')==0 || exist('PP_Array1','var')==0 || exist('PR_Array1','var')==0
       helpdlg('Bootstrapped cluster density analysis is not carried out. Run analisis ') 
       stop_missing_data    %%%%%%%%%%%%%% stop
     end
     end  
 end
 catch
     clc
     A_start;
 end
    

