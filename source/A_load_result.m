close all
clear
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
try
[pathname,dirname] = uigetfile('Res*.mat');
fullpath = fullfile(dirname,pathname);
drname=dirname;
load(fullpath);
load('R SIM.mat')
msgbox('Result data are loaded')


catch
    clc
    msgbox('Fullpath is not correct. Please load new data')
    A_start
end   