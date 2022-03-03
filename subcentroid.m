function c_pri=subcentroid(cl,pos,c_primar)
clc


clear('c_pri')
c_pri=c_primar;


N_number=[];
M=size(c_pri,1);
for i=1:M
    c_pri(i,4)=i;
end

for i=1:M
    
epp=find(cl==i);
poc=pos(epp,:);
NC=numel(epp);
N_number(i)=NC;

if NC < 30000
    D=pdist2(poc,poc);
    D=sort(D);
    mean_dists=mean(D(2,:));
    min_dists=min(D(2,:));
    max_dists=max(D(2,:));
    clear('D');
else
    [mean_dists,~]=estimation_min_dist(poc);
    
end

[clsub,c_primarsub]=DBSCAN_neu(poc,mean_dists,2.0,5,4,NC);
L=max(clsub);

if L>1
e1=find(c_pri(:,4)==i);    
c_pri(e1,:)=[]; 
c_primarsub(:,4)=i;
c_pri=[c_pri',c_primarsub']';    
    
end

end

%plot2d_primary_cluster_only(pos,cl,c_pri);

clear('poc')
end

