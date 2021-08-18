options.Interpreter = 'tex';
options.Default = 'NO';
button = questdlg('\fontsize{12} Do you want to filter the data.  Outliers  will be removed. {\it  It needs a few minutes of time.}',' Filter','YES','NO',options);

switch button
    case 'NO'
       clear('button')
       filtruj=0;
       %quit cancel;
        A_start;
    case 'YES'
        clear('button')
        filtruj=1;
        quit cancel;
end


