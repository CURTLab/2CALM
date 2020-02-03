function [Vbox,lam_box,avg_midi,std_midi,midi]=D3_sample_preparation_plus(pos)


NA=size(pos,1);
%%%%%%%%%%%%%%%%%% Global density %%%%%%%%%%%%%%%%%% 
Vbox=(max(pos(:,1))-min(pos(:,1)))*(max(pos(:,2))-min(pos(:,2)))*(max(pos(:,3))-min(pos(:,3)));
lam_box=NA/Vbox;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%tic
if NA < 20000
    %disp(' Direct min distance calculation: Please wait')
    
    D=pdist2(pos,pos);
    D=sort(D);
    midi=D(2,:)'; 
    clear('D')
    avg_midi=mean(midi);
    std_midi=std(midi);
    
else
   disp('Big data. Min distance estimation: Please wait ca. 25 seconds')
   [avg_midi,std_midi]=estimation_min_dist(pos);
   midi=[];
end
%toc

end
