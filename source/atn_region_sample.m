
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% data preparation %%%%%%%%%%%%%%%
if exist('status','var')==1
    if status==1 || status==2
       dator=dat;
       Nor=N;
       prestatus=status;
    end
else
   dator=dat;
   Nor=N;
end

data_test= exist('rgi','var');
if data_test==1
    if isempty(rgi)==1
        data_test=0;
    else
        data_test=1;
        N_region=Num_Region(dat(:,rgi));
    end
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clc
if data_test==0 
  
answer_region;
close all
a_info_datprep
try
[dat,N_region,rgi,rgfi,rgsi,colhead]=a_region_extraction(dat,xi,yi,zi,szi,colhead,alpha_s,1);
catch
msgbox('Expected data format not available. Calculations are interrupted by the user')
close all
clc
A_start;
end
dat(:,rgsi)=0;

%%%%%%%%%%%%%%%%%%%%%%%% save result of region extraction %%%%%%%%%%%%%%%%%%%%%%%%
load(fullpath);
par.pkmatrix=dat;
par.pkdesc.desc=colhead';
save(fullpath,'par');
clear('par');
status=4;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
atn_answer_region_again;
else  
close all
disp('Regions of sample are extracted')
pos=[dat(:,xi),dat(:,yi),dat(:,zi)];
if sum(dat(:,rgsi))==0
    clnew=dat(:,rgi);
    disp('No region is saved')
    ttext='No region is saved';
else
    clnew=dat(:,rgsi);
    disp('These regions are saved')
    ttext='These regions are saved';
end
plot2d_region(pos,clnew,pos,N_region)
suptitle ([exname,' \newline',ttext])
atn_answer_region_again;
end





clear('clnew','data_test','pos','test_dat','alpha_s')