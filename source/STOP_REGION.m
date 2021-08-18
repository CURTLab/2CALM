

options.Interpreter = 'tex';
options.Default = 'Yes';
button = questdlg('\fontsize{11}Do you want to automatically extract regions of interest - ROI','Extract ROI','Yes','No',options);

switch button
    case 'Yes'
       disp('ROI extraction')
           %close
           clear('button')
          atn_answer_sample2roi_aut;
    case 'No'
            close
            clear('button')
            quit cancel;
           
end