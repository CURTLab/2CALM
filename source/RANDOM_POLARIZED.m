
load('rand_param.mat')
answer_polarization_random;



clear('u')
rng('default')
u=rand(30,1);
rm=800;
rM=7000;
rzM=500;
xp=[];
yp=[];
zp=[];
xk=[];
yk=[];
zk=[];
xc=7500;
yc=7000;
zc=500;

for i=1:anz

alph=2*pi*u(i,:);
a=rand;
if a<0.5
    a=0.6;
end
rMn=rM*a;
rzMn=rzM*a;
xp(i)=cos(alph)*rm+xc;
xk(i)=cos(alph)*rMn+xc;
yp(i)=sin(alph)*rm+yc;
yk(i)=sin(alph)*rMn+yc;
zp(i)=sin(alph)*10+zc;
%zk(i)=cos(alph)*rzMn+zc;
zk(i)=rand*rzMn+zc;
end
   N=size(random_distance,1);
   rdis=random_distance/6000;
   cnsmal=[];
   k=1;
for i=1:anz
    ss=0;
    xl(k)=xp(i);
    yl(k)=yp(i);
    zl(k)=zp(i);
  %  disp([num2str(xp(i)),'/',num2str(xk(i)),'/',num2str(k)])
    cnsmal(k,1:3)=[xl(k),yl(k),zl(k)];
    
    while ss <1
    k=k+1;
    j=randi(N);
    delt= rdis(j,:);
    popr=max(0.9998,rand);
    
    xl(k)=xl(k-1)+delt*(xk(i)-xp(i));
    yl(k)=yl(k-1)+delt*(yk(i)-yp(i));
    zl(k)=zl(k-1)+delt*(zk(i)-zp(i));
    xl(k)=xl(k)*popr;
    yl(k)=yl(k)*popr;
    cnsmal(k,1:3)=[xl(k),yl(k),zl(k)];
    ss=ss+delt;
   
    end
     k=k+1;
%disp([num2str(i),'/',num2str(xp(i))])
end

%%%%%%%%%%%%%%%%%%%% end centroids small %%%%%%%%%%%%%%%%%%%%%%

Nc=size(cnsmal,1);
M = size(SmallPart,1);
data=[];
for j=1:Nc
    kk=randi(M);
    sigm=SmallPart(kk,1:3);
    num=4*SmallPart(kk,4);
    mu=cnsmal(j,:);
    r00=[];
    for m=1:num
        r00(m,:)= normrnd(mu,2*sigm);
    end
    data=[data',r00']';
end


mu=[xc,yc,zc];
sigm=BigPart(1,1:3);
num=round(3.5*BigPart(1,4));
r00=[];
    for m=1:num
        r00(m,:)= normrnd(mu,1.4*sigm);
    end

 data=[data',r00']';
 data(:,3)=data(:,3)-500;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
fig=0;
if fig==1
figure
whitebg('w')
hold on
%plot3(xc,yc,zc,'or')
grid on
%plot3(xp,yp,zp,'sm')
hold on
%plot3(xk,yk,zk,'ob')
for i=1:anz
    px=[xp(i),xk(i)];
    py=[yp(i),yk(i)];
    pz=[zp(i),zk(i)];
%line(px,py,pz)
end
%plot3(cnsmal(:,1),cnsmal(:,2),cnsmal(:,3),'.k')
plot3(data(:,1),data(:,2),data(:,3),'.g')
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
exname=['Polarized-random-samle-nr ',num2str(nnn)];
colhead={'x','y','z'};
[xi,yi,zi,ini,sxi,szi,fri,lasti,dat,colhead]=E_data_extraction_index(colhead,data);


plot_original_data_12d(dat(:,xi),dat(:,yi),dat(:,zi),exname);

par.pkmatrix=dat;
par.data=[];
par.pkdesc.desc=colhead';
par.pkdesc.units={'nanometer'};
par.colheaders=[];

tekst=['Random_sample_polarized_',num2str(nnn),'.mat'];
save(tekst,'par')
msgbox(['Random data has been successfully generated and saved in main directory as ',...
tekst,' Use Load New Data button to analyze them.'])

clear