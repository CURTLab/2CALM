options.Interpreter = 'tex';
options.Default = 'YES';
button = questdlg(['\fontsize{12}Do not exist data from the analysis. Do you want to perform the missing analysis'],'MLP','YES','NO',options);

switch button
    case 'YES'
        clear('button','options')
        quit cancel;
    case 'NO'
        clear('button','options') 
        quit cancel;
       
end