
try

if exist('pathname1','var')==1
    fullpath1 = fullfile(dirname1,pathname1);
else
   t=[exname1(1:2),extractAfter(fullpath1,exname1(1:2))];
   fullpath1=fullfile(dirname1,t);
   pathname1=t; 
end
if exist('pathname2','var')==1
    fullpath2 = fullfile(dirname2,pathname2);
    else
   t=[exname2(1:2),extractAfter(fullpath2,exname2(1:2))];
   fullpath2=fullfile(dirname2,t);
   pathname2=t; 
    
end

clear('t')
catch
    msgbox('Pathname is not correct. Please check the directory name')
    clc
    A_start;
end