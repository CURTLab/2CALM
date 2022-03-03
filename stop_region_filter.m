options.Interpreter = 'tex';
options.Default = 'NO';
button = questdlg('\fontsize{12}Do you want to filter the regions. Outlier groups will be removed','Region filter','YES','NO',options);

switch button
    case 'NO'
       clear('button')
       region_filter=0;
       quit cancel;
    case 'YES'
        clear('button')
        region_filter=1;
        quit cancel;
end



