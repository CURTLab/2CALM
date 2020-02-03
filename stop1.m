options.Interpreter = 'tex';
options.Default = 'CONTINUE';
button = questdlg('\fontsize{12}Do you want to stop the program now? If NO then choose the second dataset','STOP CALCULATION','CONTINUE','STOP',options);

switch button
    case 'STOP'
       disp('Exiting data loading')
       clear('button')
       status=0;
       close all
       helpdlg('Calculations had been aborted','Load message')
       A_start;
       %stop_by_user;
    case 'CONTINUE'
        
        clear('button')
        clc
        quit cancel;
end



