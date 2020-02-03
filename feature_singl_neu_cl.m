



function [nz,dens,cur,intcl,c,larg]=feature_singl_neu_cl(cl,pos,inten,den_typ)
         
%%%%%%% den_typ=0;density sum of bullet,den_typ=1 density box %%%%%%%%%%%%

S=max(cl);
clear('nz','dens','cur', 'c', 'intcl' ,'larg')
nz(1:S,1)=0;
dens(1:S,1)=0;
cur(1:S,1)=0;
c(1:S,1:3)=0;
intcl(1:S,1)=0;
larg(1:S,1:2)=0;
for j=1:S
    ep=find(cl==j);
    n=numel(ep);
    nz(j)=n;
    larg(j,:)=[n,j];
    if isempty(inten)==0
        in=inten(ep,:);
        intcl(j)=sum(in);
    else
        intcl(j)=0;
    end
    
    postem=pos(ep,:);
    if n>1
        c(j,:)=mean(postem);
        else
        c(j,:)=postem;
    end 
    if den_typ == 0
        dens(j)= density_bullet(postem,pos);
    else 
        dens(j)= density_box(postem,pos);
    end
    cur(j)= curvature(postem);
end

