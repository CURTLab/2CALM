options.Interpreter = 'tex';
options.Default = 'NO';
button = questdlg(['\fontsize{12}{\bf     MACHINE LEARNING MODULE:}','\newlineDo you want to test this analisis data with MLP neural network'],'MACHINE LEARNING','YES','NO',options);

switch button
    case 'NO'
       clear('button','options')
       quit cancel;
    case 'YES'
       
        tt_info;
        pause(1)
        clear('button','options') 
       %close all
        answer_mlp_training;
end
