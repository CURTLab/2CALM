


clc
close all
save('temp_short.mat')


%%%%%%%%%%%%%%%%%%%%%%%%% open file %%%%%%%%%%%%%%%%%%%%%%%%%%%
[pathname,dirname] = uigetfile('*.mat');
fullpath = fullfile(dirname,pathname);
load(fullpath);
exname=pathname;
clear('datacell','pathname')
exname = strrep(exname,'_','-');
exname = strrep(exname,'.mat','');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
data_test= exist('par','var');


%%%%%%%%%%%%%%%%%%%%%%data and index preparation%%%%%%%%%%%%%%%%%%%%%%%%%%%
 
if data_test == 1
 colhead=par.pkdesc.desc';
 dat=par.pkmatrix;
 [xi,yi,zi,ini,sxi,szi,fri,lasti,rgi,rgfi,rgsi]=data_extraction_index(colhead);
 clear('par');
 
else
clear  
a_info_wrong_data;
load('temp_short.mat');
stop_wrong_data;
A_start;
end


%%%%%%%%%%%%%%%%%%% NaN value elimination %%%%%%%%%%%%%%%%%%%% 


%%%%%%%%%%% NaN elimination

ww=[];
 for i=1:lasti
    snan=isnan(dat(:,i));
    snani=find(snan==1);
    ww=union(ww,snani);
 end

dat(ww,:)=[];
N=numel(dat(:,xi));
sfrM=max(dat(:,fri));


clear('ww','snan','snani','toleranz','data_test','i')


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
plot_original_data_12d(dat(:,xi),dat(:,yi),dat(:,zi),exname);
%%%%%%%%%%%%%%%%%%%%%%%%%end load %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



