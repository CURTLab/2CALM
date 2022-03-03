clc
clear
close all

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
status=0;
try
Data_Load_1;
catch
close all
a_info_wrong_data;
helpdlg('Calculations had been aborted','load message')
A_start;
end
stop1
try
Data_Load_2;
catch
close all
a_info_wrong_data;
helpdlg('Calculations had been aborted','load message')
A_start;
end
TEST_R=[0.0,0.0,0,0.05,0.05,250,150];
clear('hh')
reload_again;
status=1;