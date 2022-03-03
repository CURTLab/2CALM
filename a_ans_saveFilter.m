
options.Interpreter = 'tex';
options.Default = 'YES';
button = questdlg(['\fontsize{12}Do you want to save filtered samples '],'ROI','YES','NO',options);

switch button
    case 'YES'
        save_filter;
        a_info_save_filter;
        clear('button','options')
        quit cancel;
    case 'NO'
        clear('button','options') 
        quit cancel;
       
end