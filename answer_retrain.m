


button = questdlg('Do you want to retrain the MLP network or only test the data',...
    'MLP_Clas ','RETRAIN','TESTING','STOP','TESTING');
switch button
    case 'RETRAIN'
      
     clc
     clear('button')
     tt_retrain_mlp;
     answer_retrain;
     %stop_again;
    case 'TESTING'
            
    clear('button')
    tt_mlpclasif;
    answer_retrain;
    %stop_again;  
    case 'STOP'
         
      clc
      clear('button')
      
clear('c','i','in','INN','k','L','M','missc','n','net',...
'NeuronNumber','no_pair','options','ou','out','OUU','para_nr',...
'prob','prob2','scr','scrsz',...   
'test_nr','testname','texnam','u','ww')

      quit cancel; 
end