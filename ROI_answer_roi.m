options.Interpreter = 'tex';


pause(0.05)
x = inputdlg({'\fontsize{11}Enter the ROI number'},'ROI',[1,40],{'1'},options);
if isempty(x)==0
ROI_nr= str2double(x);
clear('x','button','options')
else
clear('x','button','options')
quit cancel
end