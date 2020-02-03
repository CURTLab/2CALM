clc

dat(:,rgsi)=0;
stop_region_filter;
region_id=large_region(N_region);
aa=numel(region_id);
%%%%%%%%%%%%%%%%%% number of ploted regions %%%%%%%%%%%%%%%
if aa<10
    faw=1;
elseif aa>20
    faw=0.5;
else
    faw=0.7;
end
w=round(faw*aa);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
for i=1:w
reg_id=region_id(i);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
if region_filter == 1
    cl_id=rgfi;
    cl_n=dat(:,rgfi);
    an=find(dat(:,rgfi)== reg_id);
    daton=dat(an,:);
    N_n=size(daton,1);
   
elseif region_filter ==0
    cl_id=rgi;
    cl_n=dat(:,rgi);
    an=find(dat(:,rgi)==reg_id);
    daton=dat(an,:);
    N_n=size(daton,1);
    
end

status=4;
pos=[daton(:,xi),daton(:,yi),daton(:,zi)];
pos_all=[dat(:,xi),dat(:,yi),dat(:,zi)];

atn_plot_regions
atn_stop_save
end
close all
load(fullpath);
par.pkmatrix=dat;
par.pkdesc.desc=colhead';
save(fullpath,'par')
clear('par');
           %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            pos=[dat(:,xi),dat(:,yi),dat(:,zi)];
            if sum(dat(:,rgsi))==0
             clnew=dat(:,rgi);
             ttext='No region is saved';
            else
             clnew=dat(:,rgsi);
             ttext='These regions are saved';
            end
plot2d_region(pos,clnew,pos,N_region)
suptitle ([exname,' \newline',ttext])
             clear('button','pos','clnew','ttext')
             clc

clear('faw','aa','an','cl_id', 'cl_n', 'clustm','clustM','cregion','daton','i','N_n','pos','pos_all','reg_id',...
'region_filter' ,'region_id','w','xcl', 'ycl', 'zcl','clnew','ttext' )