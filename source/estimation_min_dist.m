


function [avg_min_dist,std_min_dist]=estimation_min_dist(pos)

sample=8000;
M=15;
n(1:M)=0;
N=length(pos(:,1));
   tic
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
for i= 1:M
    enum= generator(sample,N);
    D=pdist2(pos(enum,:),pos(enum,:));
    D=sort(D);
    n(i)=median(D(2,:));
    
end
avg_min_dist=mean(n);
std_min_dist=std(n);
toc 
end