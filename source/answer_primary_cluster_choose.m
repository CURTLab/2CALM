


largp1 =sortrows(largp1,1,'descend');
largp2 =sortrows(largp2,1,'descend');


pause(0.05)
if size(largp1,1)>=10
    cluster_id1=largp1(1:10,2)';
else
    cluster_id1=largp1(:,2)';
end 
if size(largp2,1)>=10
    cluster_id2=largp2(1:10,2)';
else
    cluster_id2=largp2(:,2)';
end 

options.Interpreter = 'tex';

x = inputdlg({['Enter index of cluster in sample 1. Large clusters: ',num2str(cluster_id1)],['Enter index of region in sample 2. Large clusters: ' ,num2str(cluster_id2)]},'CLUSTER',[1,100;1,100],{num2str(cluster_id1(1)),num2str(cluster_id2(1))},options);
if isempty(x)==0
    clust1= str2double(x{1,1});
    clust2= str2double(x{2,1});
    if isnan(clust1)==1 || isnan(clust2)==1
        hh=msgbox('Entry is not a number');
        pause(1);
        close(hh)
        clear('x','cluster_id1','cluster_id2','hh')
        answer_primary_cluster_choose;
        quit cancel
    end
else
    clear('x','cluster_id1','cluster_id2','hh')
    A_start;
    quit cancel
end
