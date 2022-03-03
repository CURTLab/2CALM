close all
clear
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
try
[pathname,dirname] = uigetfile('Res-*.mat');
fullpath = fullfile(dirname,pathname);
dirnamen=dirname;
load(fullpath);
testname=pathname;
dirname1=dirnamen;
dirname2=dirnamen;
exnameo1= strrep(exname1,'-','_');
exnameo2= strrep(exname2,'-','_');
fullpath1=[dirname1,exnameo1];
fullpath2=[dirname2,exnameo2];


msgbox('Current results are successfully loaded')
 A_plot_data_label;
clear('fullpath','pathname','dirnamen','dirname')
clear('che','tekst')
clear('exnameo1','exnameo2')
catch
    clc
    msgbox('Fullpath is not correct. Please load new data')
    A_start
end   