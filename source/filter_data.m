function [dat,N]=filter_data(dat,xi,yi,zi)

XX=dat(:,xi);
N=size(XX,1);
%%%%%%%%%%%%%%% reduction to 150000 points
if N > 150000
    N1=150000;
    dato= data_reduction(dat,N1,N);
    N=length(dato(:,1));
    clear('dat')
    dat=dato;
end
clear('dato','XX')
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
pos=[dat(:,xi),dat(:,yi),dat(:,zi)];
%%%%%%%%%%%%%%%%%%%%%%% min dist estimation %%%%%%%%%%%%%%%%%
if N <= 100000
    
    disp('Distance calculation: Please wait')
    tic
    [Dmin,dminavg]=distmin_NN(pos);
    avg_min_dist=dminavg;
    toc
    a_filtration_type;
    
else
   ster=1;

   a_info_filter;
   disp('Big data. Min distance estimation: Please wait approx. 1 minute')
   [avg_min_dist,~]=estimation_min_dist(pos);
end
%%%%%%%%%%%%%%%%%% reduction for big data %%%%%%%%%%%%%%%%%%%%%


%%%%%%%%%%%%%%%%%%%%% primary cluster 
alpha=2;
if ster==1
disp(' Main-clusters filtration: (DBSCAN)')
[cl,~]=DBSCAN_neu(pos,avg_min_dist,alpha,4,2,N);
ep=find(cl==0);
dat(ep,:)=[];
N=size(dat,1);

elseif ster==0
disp('Fast filtration: nearest neighbor (NN)')
ep=find(Dmin > alpha*avg_min_dist);    
dat(ep,:)=[];
N=size(dat,1);
   
clear('N1','alpha','cl','ep','pos')
end

