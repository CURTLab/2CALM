
    if  exist('dat2','var')==1 && isempty(dat2)==0
      
        disp(['Ripley: ',para])
       
    else
        msgbox('Sample 2 do not exists. Please load data of sample 2','INFO');
        stop_ripley;
     
    end
    ripley_analisis;