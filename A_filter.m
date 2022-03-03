 if exist('dat1','var')==0 || exist('dat2','var')==0
      status=0;    
      a_info_load; 
      A_start;
      
    elseif isempty(dat1)==1 ||  isempty(dat2)==1 
      status=0;    
      a_info_load; 
      A_start;  
    end



stop_filter;
clc
if filtruj==1
   a_info_datprep;
   dat1or=dat1;
   dat2or=dat2;
   N1or=N1;
   N2or=N2;
%%%%%%%%%%%original data stored%%%%%%%%%%%% 
 disp('First sample')
   [dat1,N1]=filter_data(dat1,xi1,yi1,zi1);
 disp('Second sample')
   [dat2,N2]=filter_data(dat2,xi2,yi2,zi2);
end  
 clear('hh')

    


%%%%%%%%%%%%%%%%%%%%% filtered data stored dat1/2 as orignal %%%%%%%%%%%%%
    
status=2;
plot_reduction;
a_ans_saveFilter;

clear('filtruj','ster')