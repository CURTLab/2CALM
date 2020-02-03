function [d,dmin_avg,box_ripl]=dist_min(pos)

N=size(pos,1);
xmin=min(pos(:,1));
xmax=max(pos(:,1));
ymin=min(pos(:,2));
ymax=max(pos(:,2));
zmin=min(pos(:,3));
zmax=max(pos(:,3));

%rmin=min([xmax-xmin,ymax-ymin,zmax-zmin]);
box_ripl=[xmin,xmax,ymin,ymax,zmin,zmax];
d(1:N,4)=0;
%tic
if N<6000
    a=pdist2(pos,pos);
    a=sort(a);
    d(:,1)=a(2,:)';
    d(:,2)= min(pos(:,1)-xmin,xmax-pos(:,1));
    d(:,3)= min(pos(:,2)-ymin,ymax-pos(:,2));
    d(:,4)= min(pos(:,3)-zmin,zmax-pos(:,3));
    clear('a')
else
    for i=1:N
        a=pdist2(pos(i,:),pos);
        a(i)=1e+20;
        d(i,1)=min(a);
        d(i,2)= min(pos(i,1)-xmin,xmax-pos(i,1));
        d(i,3)= min(pos(i,2)-ymin,ymax-pos(i,2));
        d(i,4)= min(pos(i,3)-zmin,zmax-pos(i,3));
    end
    clear('a')
end
%disp('Min distance calculation')
%toc
dmin_avg=mean(mean(d(:,1)));
end
