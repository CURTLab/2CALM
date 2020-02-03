
options.Interpreter = 'tex';
options.Default = 'NO';
button = questdlg('\fontsize{12}Do you want to save this region?','SAVE','YES','NO',options);

switch button
    case 'NO'
     
       clear('button')
       %clear all
        quit cancel
    case 'YES'
        clear('button')
        atn_save_region;
        quit cancel;
end