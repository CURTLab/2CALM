
options.Interpreter = 'tex';
options.Default = 'NO';
button = questdlg(['\fontsize{10}Sample regions (ROI) are extracted.  \newline \fontsize{10} Do you want to extract ROI once more'],'Extract ROI','YES','NO','CANCEL',options);

switch button
    case 'YES'
        dat=dator;
        clear('rgi','rgfi')
        disp('ROI extraction')
        close all
        clear('button')
        atn_region_sample;
    case 'NO'
        clear('button')
        atn_answer_save_update;
           
    case 'CANCEL'
         clear('button')
         quit cancel
end