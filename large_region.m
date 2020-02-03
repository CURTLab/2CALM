
function region_id=large_region(N_region)

N_sort=sortrows(N_region,2,'descend');
Nmean=median(N_sort(:,2));
ap=find(N_sort(:,2)>= Nmean);
region_id=N_sort(ap,1)';
end