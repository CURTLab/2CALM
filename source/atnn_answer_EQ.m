options.Interpreter = 'tex';
options.Default = 'CANCEL';
if fdens < thre
    tt='do not equalize the samples';
else
    tt='equalize density/size of samples';
end

button = questdlg(['\fontsize{10}\newlineSample1 ',num2str(N1),' density ',num2str(lamb1a),...
    ' and  Sample2 ',num2str(N2),' density ',num2str(lamb2a),' \newline\bfDENSITY DIFFERENCE ',num2str((fdens-1)*100),' %',...
'   SUGGESTION: ',tt],...
    'EQ','DENSITY EQUALIZE','SIZE EQUALIZE','CANCEL',options);
switch button
    case 'DENSITY EQUALIZE'
       
        clc
        clear('button')
        atnn_eq_density;
        quit cancel;  
   
    case 'SIZE EQUALIZE'
     clc
     atnn_eq_size;
     clear('button') 
     
     quit cancel;
     case 'CANCEL'
     clc
     clear('button')
     A_start;
end