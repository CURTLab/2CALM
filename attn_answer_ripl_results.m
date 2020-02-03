options.Interpreter = 'tex';
options.Default = 'YES';
button = questdlg('\fontsize{12}Do you want to show current results?','Ripley','YES','NO',options);

switch button
    case 'YES'
       disp('Ripley results')
       clear('button')
       attn_plot_rip_result; 
    case 'NO'
            clear('button')
            A_start
            quit cancel;
           
end