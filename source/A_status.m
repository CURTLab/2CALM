
function xt=A_status(status,dat1,dat2)


if status==0
xt=['Only partial data available:   Sample 1: ',num2str(size(dat1,1))];
elseif status==1
xt=['Full data: Sample 1: ',num2str(size(dat1,1)),' and Sample 2: ',num2str(size(dat2,1))];
elseif status==2
xt=['Data after filtration: Sample 1: ',num2str(size(dat1,1)),' and Sample 2: ',num2str(size(dat2,1))];
elseif status==3
xt=['Reduced or equalized data: Sample 1: ',num2str(size(dat1,1)),' and Sample 2: ',num2str(size(dat2,1))];
elseif status==4
xt=['Data applies to the region: Sample/Region 1: ',num2str(size(dat1,1)),' and Sample/Region 2: ',num2str(size(dat2,1))];
elseif status==5
xt=['Data applies to the primar-cluster only: Sample 1: ',num2str(size(dat1,1)),' and Sample 2: ',num2str(size(dat2,1))];
end
end

