options.Interpreter = 'tex';
if exist('para_nr','var')==1
  de_pair_nr=num2str(para_nr);
else
   de_pair_nr=' ';
end
pause(0.05)
x = inputdlg({'\fontsize{12}Enter pair number'},'PAIR',[1,80],{de_pair_nr},options);
if isempty(x)==0
para_nr= str2double(x);
if isnan(para_nr)==1 
        hh=msgbox('Entry is not a number');
        pause(0.5);
        close(hh)
        clear('x','alp','hh')
        answer_pair_nr;
        quit cancel
end
clear('x')
else
clear('x')
A_start;
quit cancel
end