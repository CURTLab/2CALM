options.Interpreter = 'tex';
options.Default = 'No';
button = questdlg('\fontsize{12}Do you want to generate sample with noise','Noise','Yes','No',options);

switch button
    case 'Yes'
       clear('button')
       noi=1;
       min_element=15;
       quit cancel;
    case 'No'
        clear('button')
       noi=1;
       min_element=8;
        quit cancel;
end