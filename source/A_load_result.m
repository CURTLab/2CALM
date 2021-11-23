close all
clear
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
try
[pathname,dirname] = uigetfile('..\Res-*.mat');
fullpath = fullfile(dirname,pathname);
drname=dirname;
load(fullpath);

testname=pathname;

dirname1=drname;
dirname2=drname;

fullpath_check;
  Figure_start;
  A_plot_data_label;
msgbox('Result data are loaded')

clear('fullpath','pathname','drname','t')
clear('che','tekst')

catch
    clc
    msgbox('Fullpath is not correct. Please load new data')
    A_start
end   