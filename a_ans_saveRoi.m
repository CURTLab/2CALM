
options.Interpreter = 'tex';
options.Default = 'YES';
button = questdlg(['\fontsize{12}Do you want to save ROI '],'ROI','YES','NO',options);

switch button
    case 'YES'
        ROI_answer_roi;
        tekst1=['ROI_',num2str(ROI_nr),'_',exname,'.mat'];
         tekst=[dirname,tekst1];
         save(tekst,'par');
         a_info_region_manual; 
         clear('button','options')
         clear('tekst1','tekst','par','ROI_nr')
         quit cancel;

      
    case 'NO'
        clear('button','options') 
        quit cancel;
       
end