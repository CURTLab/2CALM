
try
if exist('c_primar1','var')== 0 ||  exist('c_primar2','var')==0 || exist('cl1','var')== 0 || exist('cl2','var')== 0
    sstop;
else
    if isempty(c_primar1)==1 || isempty(c_primar2)==1
        sstop;
    end
end
catch
    clc
    disp('primary cluster do not exist' )
    hh=msgbox('Clusters do not exist. Perform CLUSTERING ONE sample pair','INFO','modal');
    clear('hh');
     clear('btn','button','task')

    A_start;
end

try
if exist('c1standard','var')== 0 ||  exist('c2standard','var')==0 || exist('kt1rys','var')== 0 || exist('kt2rys','var')== 0
    sstop;
end
catch
    clc
    disp('standard cluster do not exist' )
    hh=msgbox('Hierarchical clusters do not exist. Perform clustering','INFO','modal');
    clear('hh');
     clear('btn','button','task')
    A_start;
end





try
if isempty(c_primar1)== 1 ||  isempty(c_primar2)== 1 
    sstop;
end
catch
    clc
   disp('primary cluster do not exist')
   hh=msgbox('Primary clusters do not exist. Increase radius','INFO','modal');     
   clear('hh');
    clear('btn','button','task')

   A_start; 
end



try
if exist('largp2','var')==0 ||  exist('largp1','var')==0    
    sstop;
end
catch
    clc
    disp('primary cluster do not exist')
    hh=msgbox('Largest primary clusters do not exist. Perform primary clustering','INFO','modal');     
    clear('hh');
     clear('btn','button','task')

   A_start; 
end

try
if exist('posprim2','var')==0 ||  exist('posprim1','var')==0
      sstop;
end
catch
    clc
    disp('primary cluster do not exist' )
    hh=msgbox('Points for clustering do not exist (posprim). Perform primary clustering','INFO','modal');
    clear('hh');
     clear('btn','button','task')

   A_start; 
end



