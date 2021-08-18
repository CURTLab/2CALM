
 if exist('dat1','var')==0 || exist('dat2','var')==0
      status=0;    
      a_info_load; 
      A_start;
      
    elseif isempty(dat1)==1 ||  isempty(dat2)==1 
      status=0;    
      a_info_load; 
      A_start;  
 end






options.Interpreter = 'tex';
options.Default = '2D';
button = questdlg(['\fontsize{12}{\bf DRAW SAMPLES ?} '],'DRAW SAMPLE','2D','3D',options);

switch button
    case '2D'
        
       plot_reduction;
       clear('button','options')
       quit cancel;
    case '3D'
       plot_reduktion_3d;
        clear('button','options') 
        quit cancel;
       
end
