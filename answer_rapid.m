
nmin=min(N1,N2);
pause(0.05)
mmin=min(nmin,15000);
x = inputdlg({['Enter size of reduced data. Max ' ,num2str(nmin)]},'Rapid',[1,40],{num2str(mmin)});
if isempty(x)==0
nmin= str2double(x);
clear('mmin')
clear('x','button')
else
close all
clear('x','button')
quit cancel
A_start;
end