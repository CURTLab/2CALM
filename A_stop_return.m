options.Interpreter = 'tex';
options.Default = 'RESTORE';

button = questdlg('\fontsize{12}Do you want to restore the previous data','RETURN','RESTORE','NO',options);

switch button
    case 'RESTORE'
       disp('Data reload')
       clear('button')
       close
       A_return;
    
    case 'NO'
        clear('button')
        quit cancel;
       
end
