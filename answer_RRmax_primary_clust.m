pause(0.05)
x = inputdlg({['Enter radius (size) for clustering process in nm.         Average min distance = ',num2str(avg_min_dist1),' and ',num2str(avg_min_dist2),' nm'] },'RADIUS',[1,60],{num2str(RRmax)});
if isempty(x)==0
RRmax= str2double(x); 
clear('x')
else
clear('x', 'button')
close all
try
close(hhc);
clear('hhc')
catch
 clear('hhc')   
end
quit cancel
A_start;
end