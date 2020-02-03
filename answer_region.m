options.Interpreter = 'tex';


pause(0.05)
x = inputdlg({'\fontsize{12}Enter region-large coefficient (between 1-4); The larger the coefficient, the larger are the regions' },'REGION',[1,80],{'2.0'},options);
if isempty(x)==0
alpha_s = str2double(x);
clear('x')
else
helpdlg('Calculations had been aborted','load message')
%
clear('x')
quit cancel
A_start;
end