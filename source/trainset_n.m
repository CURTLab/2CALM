function[VTR,GRT,VRR,GRR]=trainset_n(V,GR,proc)

VTR=[];
EE=[];
GRT=[];
VRR=[];
GRR=[];
if proc == 0
    proc=0.25;
end

if proc >=1.0
    VTR=V(:,:);
    GRT=GR(:,:);
    VRR=V(:,:);
    GRR=GR(:,:);
else
imax=length(V(:,1));
n=round(proc*imax);

    e=randi(imax,n,1);
    VTR=V(e,:);
    GRT=GR(e,:);   
    

VRR=V;
VRR(e,:)=[];
GRR=GR;
GRR(e,:)=[];
end
end
