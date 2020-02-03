if status == 0
    clc;
    disp('Only partial data available')
    hr1=msgbox('Only part of data available. Please load data','INFO','modal');
    msgboxFontSize(hr1,12);
    clear('hr1','ans')
elseif status == 1
    clc;
    disp('Full data available')
    hr2=msgbox('Full data available','INFO','modal');
    msgboxFontSize(hr2,12);
    clear('hr2','ans')
elseif status==2
    clc
    hr3=msgbox('Data after filtration - full data restored','INFO','modal');
    msgboxFontSize(hr3,12);
    clear('hr3','ans')
    Data_Load_1_again;
    close
    Data_Load_2_again;
    close
    status=1;
    
elseif status==3
    hr4= msgbox('Data after reduction - previous data restored','INFO','modal');
    msgboxFontSize(hr4,12);
    clear('hr4','ans')
    
    if exist('dat2or','var')==1
         dat1=dat1or;
         dat2=dat2or;
         N1=N1or;
         N2=N2or;
         status=1;
     else
        Data_Load_1_again;
        close
        Data_Load_2_again;
        close
        status=1;
    end
    
elseif status==4
     hr5=msgbox('Data after regionization - previous data restored','INFO','modal');
       msgboxFontSize(hr5,12);
        clear('hr5','ans')
    
    if exist('dat2or','var')==1
      dat1=dat1or;  
      dat2=dat2or;  
      N1=N1or; 
      N2=N2or;   
      status=1;
     else
        Data_Load_1_again;
        close
        Data_Load_2_again;
        close
        status=1;
    end
elseif status==5
         if exist('dat2or','var')==1
             dat1=dat1or;
             dat2=dat2or;
             N1=N1or;
             N2=N2or;
             status=1;
             hr6=msgbox('Previous data restored','INFO','modal');
              msgboxFontSize(hr6,12);
              clear('hr6','ans')
          else
            Data_Load_1_again;
            close
            Data_Load_2_again;
            close
             status=1;
             hr6=msgbox('Previous data restored','INFO','modal');
              msgboxFontSize(hr6,12);
              clear('hr6','ans')
          end
end

