
hh=msgbox(['Calculation time about ',num2str(round(A*5/60,1)),' min'],'INFO');
msgboxFontSize(hh,12);
pause(2)
try
close(hh)
clear('hh','ans')
catch
 clear('hh','ans')
end