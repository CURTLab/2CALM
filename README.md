# 2CALM

CALM Version 4.2 (2-sample Comparative Analysis of 3D Localisation Microscopy data) is an analysis pipeline, which organizes localisation microscopy data into clusters of different dimensions and calculated the samples’ statistical parameters using various numerical methods.

CALM Version 4.2 is the prototype software platform that allows a comparative analysis of 3D localisation microscopy data representing e.g. protein distributions in two biological samples. The CALM 4.2 system includes a collection of functions and scripts for handling individual menu items. The system should be unpacked together with the main CALM 4.2 directory and subdirectories (the subdirectories can be freely extended, e.g. for individual experiments). 

The system starts in the Matlab (min Version R2018) with the `CALM.m` command.

In this prototype system, the input data structure is limited to specified matlab format. Data set must be of type structure array named `par`. The structure must contain the fields:
   * `par.pkmatrix` – array of numerical data with row-measurements and columns- data coordinates.
   * `par.pkdesc` - contains two cells par.pkdesc.desc, and par.pkdesc.units:
   * `par.pkdesc.desc` - gives a description of the pkmatrix-columns line 
   * with at least the following string variables: `frame`; `x`; `y`; `z`; `pa`; `paz`; `intensity` where `pa` is the position accuracy of xy localization and `paz` is position accuracy of localization on z-axis. `frame` is frame number.
   * par.pkdesc.units contains a description  of the units of measure for each column in string format.
   
## IMPORT DATA FROM EXCEL
   In order to enable analysis of data in another format, the system has an interface to Excel
   that imports and transfers Excel data to the Matlab format described above.  
   Excel data spreadsheet  must be column-oriented and  must have at least 3 columns 
   (3D point localizations) with column headers `x`, `y`, `z`.
   If possible, the following additional columns should contain:
   * position accuracy (in nm) in xy with header `pa`
   * position accuracy (in nm) along the axis z with header `paz`
   * intensity of the point with the header `intensity`
   * the frame number with the `frame` header

   In the absence of these columns they will be automatically generated with default values typical for this type of nanoscopic samples.


# License
Copyright 2018 - 2021 Jaroslaw Jacak, 
Medical Engineering Dept. Upper Austria University od Applied Sciences, Linz, Austria
This code may be freely used and distributed, so long as it maintains this copyright line

# Citation
Please cite our paper: `Mayr S, Hauser F, Puthukodan S, Axmann M, Göhring J, et al. (2020) Statistical analysis of 3D localisation microscopy images for quantification of membrane protein distributions in a platelet clot model. PLOS Computational Biology 16(6): e1007902. https://doi.org/10.1371/journal.pcbi.1007902`

Link to paper: https://journals.plos.org/ploscompbiol/article?id=10.1371/journal.pcbi.1007902
