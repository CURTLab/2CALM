
function rtest=radius_test(pos)



xmin=min(pos(:,1));
xmax=max(pos(:,1));
ymin=min(pos(:,2));
ymax=max(pos(:,2));
zmin=min(pos(:,3));
zmax=max(pos(:,3));

rtest=min([xmax-xmin,ymax-ymin,zmax-zmin]);
%rtest=mean([xmax-xmin,ymax-ymin,zmax-zmin]);
%rtest=sqrt((xmax-xmin)^2 + (ymax-ymin)^2 + (zmax-zmin)^2);
end