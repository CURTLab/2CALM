options.Interpreter = 'tex';

pause(0.05)
x = inputdlg({'\fontsize{12}Enter significant level \alpha'},'ALPHA',[1,80],{'0.05'},options);
if isempty(x)==0
alp= str2double(x);
if isnan(alp)==1 
        hh=msgbox('Entry is not a number');
        pause(0.5);
        close(hh)
        clear('x','alp','hh')
        answer_alpha;
        quit cancel
end
clear('x')
else
clear('x')
A_start;
quit cancel
end