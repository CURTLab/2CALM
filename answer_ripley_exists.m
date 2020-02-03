options.Interpreter = 'tex';
options.Default = 'NO';
button = questdlg('\fontsize{12}Ripleys analysis is done. Do you want to repeat it?','Ripley','YES','NO',options);

switch button
    case 'YES'
       disp('Ripley run')
           clear('button')
           stop_fast_statistic; 
    case 'NO'
           
            clear('button')
            attn_answer_ripl_results;
            quit cancel;
end