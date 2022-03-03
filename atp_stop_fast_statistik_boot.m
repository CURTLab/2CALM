options.Interpreter = 'tex';
options.Default = 'YES';


button = questdlg('\fontsize{12}Do you want a rapid statistic of similarity of data based on cluster density and curvature distributions?\newline\newline The analysis will be carried out on randomly selected sub-samples.','RAPID STATISTIC D','YES','NO',options);


%button = questdlg('Do you want rapid statistics of data similarity. Analysis based on randomly selected data resamples. Their relative densities are compared','RAPID STATISTIC','YES','NO','YES');

switch button
    case 'NO'
       clear('button')
       
       A_start
    case 'YES'
        clear('button')
        analys_bootstrap_prim_plus;
        quit cancel;
end