

%CALM Version 2.1  (2-sample Comparative Analysis of 3D Localisation Microscopy data) 
%is an analysis pipeline, which organizes localisation microscopy data into 
%clusters of different dimensions and calculated the samples’ statistical parameters
%using various numerical methods.
%
%   CALM Version 2.1 is the prototype software platform that allows a comparative analysis of 
%   3D localisation microscopy data representing protein distributions in two biological samples. 
%   The platform contains published functions (see comments in the function) 
%   as well as many own functions and scripts (without comments).
%
%   In this prototype system, the input data structure is limited to specified matlab format.
%   Data set must be of type structure array named "par". The structure must contain 
%   the fields:
%   par.pkmatrix – array of numerical data with row-measurements and
%   columns- data coordinates.
%   par.pkdesc - contains two cells par.pkdesc.desc, and par.pkdesc.units:
%   par.pkdesc.desc - gives a description of the pkmatrix-columns line 
%   with at least the following string variables:
%   "frame"; "x"; "y"; "z"; "pa"; "paz"; "intensity"  where "pa" is the position accuracy 
%   of xy localization and 
%   "paz"
%    is position accuracy of localization on z-axis. "frame" is frame number.
%   par.pkdesc.units contains a description  of the units of measure 
%   for each column in string format.
%   
%   IMPORT DATA FROM EXCEL
%   In order to enable analysis of data in another format, the system has an interface to Excel
%   that imports and transfers Excel data to the Matlab format described above.  
%   Excel data spreadsheet  must be column-oriented and  must have at least 3 columns 
%   (3D point localizations) with column headers "x", "y", "z".
%   If possible, the following additional columns should contain :
%   - position accuracy (in nm) in xy with header "pa",
%   - position accuracy (in nm) along the axis z with header "paz",
%   - intensity of the point with the header "intensity",
%   - and the frame number with the "frame" header.
%
%  In the absence of these columns they will be automatically generated 
%  with default values typical for this type of nanoscopic samples.
%
%
%
% Copyright 2018 Jaroslaw Jacak, 
% Medical Engineering Dept. Upper Austria University od Applied Sciences, Linz, Austria
% This code may be freely used and distributed, so long as it maintains this copyright line

addpath('source')

Figure_start;
clear('scrsz','T')

try
    A_start;
catch
    clc
    disp('The program was aborted by the user')
end
  
  
  
  