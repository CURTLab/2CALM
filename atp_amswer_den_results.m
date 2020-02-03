options.Interpreter = 'tex';
options.Default = 'YES';
button = questdlg('\fontsize{12}Do you want to show current results?','DENSITY','YES','NO',options);

switch button
    case 'YES'
       disp('Ripley results')
       clear('button')
       atp_plot_density_result; 
    case 'NO'
            clear('button')
            A_start
            quit cancel;
           
end