function CLF=filter_data_region_short(pos,avg_filtering,Dmin)


N=size(pos,1);
CLF=[];
CLF(1:N,1)=1;

if N <= 100000
    ster=0;
   
else
   ster=1;
  
end
%%%%%%%%%%%%%%%%%% reduction for big data %%%%%%%%%%%%%%%%%%%%%


%%%%%%%%%%%%%%%%%%%%% primary cluster 
alpha=2.5;
if isempty(Dmin)==1
[cl,~]=DBSCAN_neu(pos,avg_filtering,alpha,3,2,N);
ep=find(cl==0);
CLF(ep,1)=0;


else
disp(' Direct filtering: Please wait')
ep=find(Dmin>alpha*avg_filtering);
CLF(ep,1)=0;
end
   

end

