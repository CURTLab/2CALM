

function dens_map=Dmap_n(Imax,pos,larg,cl)

Dmap1=[];
Dmap1(1:Imax,1:Imax)=0;
tra=transfLin(larg,3);
xx=pos(:,1);
yy=pos(:,2);
zz=pos(:,3);
pix=size(xx,1);
colu=normInt(xx,Imax);
rowu=normInt(yy,Imax);
for i=1:pix
    if cl(i)>0
    if Imax-colu(i)==0
        colu(i)=colu(i)-1;
    end
    
    if Imax-rowu(i)==0
        rowu(i)=rowu(i)-1;
    end
 uww=find(larg(:,2)==cl(i));
 ss=larg(uww,3);
 e=find(tra(:,1)==ss,1,'first');
 su=tra(e,2);
Dmap1(Imax-rowu(i),colu(i))=su;
end
end

dens_map=Dmap1;
end




