
options.Interpreter = 'tex';
options.Default = 'NEW TEST DATA';



button = questdlg('\fontsize{12}Do you want to use this analisis data for MLP neural network training or/and only for the test',...
    'MACHINE LEARNING ','UPDATE TRAINING DATA','NEW TEST DATA','RETRAIN OR CLASSIFY OR STOP',options);
switch button
    case 'UPDATE TRAINING DATA'
     clc
         clear('button')
         tt_training_update_mlp;
         %stop_again;
    case 'NEW TEST DATA'
         tt_test_mlp;
         %stop_again;  
    case 'RETRAIN OR CLASSIFY OR STOP'
        clc
        clear('button')
        answer_retrain;
end