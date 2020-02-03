
hh=msgbox(['Calculation time about ',num2str(round(A*U*calc_zeit(S_size)/60,2)),' min'],'INFO');
msgboxFontSize(hh,12);
pause(1)
try
close(hh)
clear('hh','ans')
catch
clear('hh','ans')
end