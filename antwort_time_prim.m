
hh=msgbox(['Calculation time about ',num2str(round(A*(U/10)*comp_time(S_size)/60,1)),' min'],'INFO');
msgboxFontSize(hh,12);
pause(1)
try
close(hh)
clear('hh','ans')
catch
 clear('hh','ans')
end