options.Interpreter = 'tex';
options.Default = 'NO';
button = questdlg('\fontsize{12}Are the sample comparison parameters up to date ? ','Parameter','YES','NO',options);

switch button
    case 'YES'
       disp('Parameter ok')
       close all;
       Loading;
       clear('button')
       
    case 'NO'
           clear('button')
           close all;
           
           edit('Init_data_store.m')
           close all;
           stop_calculation;
           quit cancel;
           
end