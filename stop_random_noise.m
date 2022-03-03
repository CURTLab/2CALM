options.Interpreter = 'tex';
options.Default = 'NO';
button = questdlg('\fontsize{12}Do you want to generate sample with noise','Noise','Yes','No',options);

switch button
    case 'Yes'
       clear('button')
       noi=1;
       quit cancel;
    case 'No'
        clear('button')
       noi=0;
        quit cancel;
end