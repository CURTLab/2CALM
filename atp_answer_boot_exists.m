options.Interpreter = 'tex';
options.Default = 'NO';
button = questdlg('\fontsize{12}Density/curvature analysis is performed. Do you want to repeat it ?','Bootstrap','YES','NO',options);

switch button
    case 'YES'
       disp('Bootstrapping run')
       clear('button')
       atp_stop_fast_statistik_boot; 
    case 'NO'
           clear('button')
           atp_amswer_den_results;
           quit cancel;
           
end