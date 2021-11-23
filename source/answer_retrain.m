


button = questdlg('Do you want to retrain the MLP network or only test the data',...
    'MLP_Class ','RETRAIN','CLASSIFY','STOP','CLASSIFY');
switch button
    case 'RETRAIN'
      
     clc
     clear('button')
     try
     tt_retrain_mlp;
     answer_retrain;
     catch
     %stop_again;
     clc
     %A_start;
     end
    case 'CLASSIFY'
     clc      
    clear('button')
    try 
    tt_mlpclasif_NEU;
    answer_retrain;
    catch
        clc
   %A_start;
    %stop_again;  
    end
    
    case 'STOP'
         
      clc
      clear('button')
      
clear('c','i','in','INN','k','L','M','missc','n','net',...
'NeuronNumber','options','ou','out','OUU',...
'prob','prob2','scr','scrsz',...   
'test_nr','testname','texnam','u','ww')

      quit cancel; 
end