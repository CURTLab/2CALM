options.Interpreter = 'tex';
options.Default = 'YES';
button = questdlg('\fontsize{12}Do you want a fast data similarity statistic based on the K-Ripley function? \newlineThe analysis will be carried out on randomly selected sub-samples','RAPID STATISTIC','YES','NO',options);

switch button
    case 'NO'
       clear('button')
       A_start
    case 'YES'
        clear('button')
        analyse_ripley;
        quit cancel;
end