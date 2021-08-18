load('voronoi_time.mat')
pos =[dat1(:,xi1),dat1(:,yi1),dat1(:,zi1)];
NTT=size(pos,1);
m=1000;
TT=[];
for i=1:200
p=m*i;
poss=pos(1:p,:);
tic
x=cputime;
[a,v]=voronoin(poss,{'Qbb'});
%Z_calcul(poss);
y=cputime-x;
TT(i)=y;
disp(['Point number ',num2str(p)])
toc
end
all=y/(i*m);

uus=lin(all,xx);
figure
whitebg('w')
plot(TT)
hold on
plot(uus);