options.Interpreter = 'tex';


pause(0.05)
x = inputdlg({'\fontsize{12}Enter number of resamples',['\fontsize{12}Enter size of resamples. Max ' ,num2str(Nmin)]},'RESAMPLING',[1,60;1,60],{'100','1000'},options);
if isempty(x)==0
    A= str2double(x{1,1});
    S_size= str2double(x{2,1});
    if isnan(A)==1 || isnan(S_size)==1
        hh=msgbox('Entry is not a number');
        pause(0.5);
        close(hh)
        clear('x','A','S_size','hh')
        answer1;
        quit cancel
        
    end
    clear('x')
else
    clear('x')
    A_start;
    quit cancel
end





