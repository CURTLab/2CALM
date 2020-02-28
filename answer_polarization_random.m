options.Interpreter = 'tex';


pause(0.05)
x = inputdlg({'\fontsize{12}Enter number of random sample',['\fontsize{12}Enter number of polarization. Max 40' ]},'random',[1,60;1,60],{'1','8'},options);
if isempty(x)==0
    nnn= str2double(x{1,1});
    anz= str2double(x{2,1});
    if isnan(nnn)==1 || isnan(anz)==1
        hh=msgbox('Entry is not a number');
        pause(0.5);
        close(hh)
        clear('x','anz','nnn','hh')
        answer_polarization_random;
        quit cancel
        
    end
    clear('x')
else
    clear('x')
    A_start;
    quit cancel
end





