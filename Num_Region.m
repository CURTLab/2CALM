
function N_region=Num_Region(cla)

N_region=[];
for i=1:max(cla)
    en=find(cla==i);
            if isempty(en)==0
             N_region(i,1)=i;
             N_region(i,2)=numel(en);
            end
end
end