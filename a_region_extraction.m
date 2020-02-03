function [dat,N_region,rgi,rgfi,rgsi,colhead]=a_region_extraction(dat,xi,yi,zi,lasti,colhead,alpha_s,rys)


%%% alpha_s- large of regions , default=2, larger =2.5

%%%%%%%%%%%%%%%%%%%%%   distance calculation %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

pos=[dat(:,xi),dat(:,yi),dat(:,zi)];
clc
disp('Distance calculation')
tic
N=size(pos,1);
[Dmin,dminavg]=distmin_NN(pos);
avg_min_dist=dminavg;
avg_filtering=dminavg;
toc   
 
 
%%%%%%%%%%%%%%%%%%%%%%%%%%   first DB SCAN %%%%%%%%%%%%%%%%%%%%%%%%%%
tic
disp('DB scan first')
[cl,c_prim]=DBSCAN_neu(pos,avg_min_dist,alpha_s,2,1,N);
 c_pria=subcentroid(cl,pos,c_prim) ;
toc
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%




cla=cl;
ep=find(cla>0);
cla(ep)=cla(ep)+10000;

%%%%%%%%%%%%%%%%%%%%%%% second DB scan %%%%%%%%%%%%%%%%
post=c_pria(:,1:3);

Nt=size(post,1);
[Dmin_2,dminavg]=distmin_NN(post);
avg_min_distt=dminavg;
clear('Dmin_2') 

tic
disp('Second DB scan')
[clt,c_primt]=DBSCAN_neu(post,avg_min_distt,alpha_s,2,1,Nt);
 c_pria=[c_pria,clt];
toc
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% region extraction %%%%%%%%%%%%%%%%%

region=[];
uM=max(clt);

for i=1:uM
en=find(clt==i);
rs=c_pria(en,4:5);
lm=size(rs,1);
     for j=1:lm
         ep=find(region==rs(j,1));
         if isempty(ep)==1
             region=[region',rs(j,:)']';
             ek=find(cl==rs(j,1));
             cla(ek)=i;
         end

     end
end




uM=max(cla);
k=max(clt);
l=max(cl);
for i = 10000:uM 
    j=i-10000;
    ep=find(cla==i);
    if isempty(ep)==0
     en=find(c_pria(:,4)==j);
     
     if isempty(en)==0
        s=c_pria(en,5);
        sm=max(s);
         if sm==0
            k=k+1;
            cla(ep)=k;
            region=[region',[j,k]']';
         else
            cla(ep)=sm;
         end
      end
     end
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% end region extraction %%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%%%%%%%%%%%%%%%% points of region  %%%%%%%%%%%%%%%%%%%%


clnew=cla;

uM=max(cla);
XX=[];
YY=[];
ZZ=[];
N_region=[];
for i=1:uM
    
    en=find(cla==i);
    if isempty(en)==0
     xcl=pos(en,1);
     ycl=pos(en,2);
     zcl=pos(en,3);
     xm=min(xcl);
     xM=max(xcl);
     XX(i,1)=xm;
     XX(i,2)=xM;
     ym=min(ycl);
     yM=max(ycl);
     YY(i,1)=ym;
     YY(i,2)=yM;
     zm=min(zcl);
     zM=max(zcl);
     ZZ(i,1)=zm;
     ZZ(i,2)=zM;
     ep=find(pos(:,1)>=xm & pos(:,1)<=xM  & pos(:,2)>=ym & pos(:,2)<=yM & pos(:,3)>=zm & pos(:,3)<=zM);
     clnew(ep)= i;
     N_region(i,1)=i;
     N_region(i,2)=numel(ep);
    end
end

disp('filtering')
     CLF=filter_data_region_short(pos,avg_filtering,Dmin);
     
     clear('clfil')
     clfil=CLF;
     clfil(:,:)=0;
     llm=size(XX,1);
     for i=1:llm
     ep=find(pos(:,1)>=XX(i,1) & pos(:,1)<=XX(i,2)  & pos(:,2)>=YY(i,1) & pos(:,2)<=YY(i,2) & pos(:,3)>=ZZ(i,1) & pos(:,3)<=ZZ(i,2));
     an=find(CLF>0);
     ee=intersect(ep,an);
     clfil(ee)= i;
     end
   
     dat(:,lasti+1)=clnew;
     dat(:,lasti+2)=clfil;
     dat(:,lasti+3)=cla;
     rgi=lasti+1;
     rgfi=lasti+2;
     rgsi=lasti+3;
     colhead{lasti+1}='rgall';
     colhead{lasti+2}='rgfilt';
     colhead{lasti+3}='rgstrong';
     lasti=lasti+3;
   
 if rys==1
    plot2d_region(pos,clnew,c_primt,N_region);
    %plot2d_region(pos,cla,c_primt,N_region)
    %plot2d_region(pos,clfil,c_primt,N_region)
    %plot3_primary_cluster_only(pos,cla,c_prim)
 end
end
 