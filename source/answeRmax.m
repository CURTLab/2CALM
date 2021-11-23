options.Interpreter = 'tex';

a_info_Rmax;
options.Interpreter = 'tex';

pause(0.05)
x = inputdlg({'\fontsize{12}Enter max radius of clusters in nm. Min 100nm',...
    ['\fontsize{12}Enter clustering step in nm. Max ' ,num2str(50),'nm']},...
    'INTERVAL',[1,60;1,60],{zzr,zzz},options);
if isempty(x)==0
    Rmax= str2double(x{1,1});
    step_clustering= str2double(x{2,1});
    dist=5:step_clustering:Rmax;
    close
    if isnan(Rmax)==1 || isnan(step_clustering)==1
        hh=msgbox('Entry is not a number');
        pause(0.5);
        close(hh)
        clear('x','step_clustering','Rmax','hh')
        answeRmax;
        quit cancel
        
    end
    clear('x')
else
    clear('x')
    close
    A_start;
    quit cancel
end
    




