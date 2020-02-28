clc
rng('default')

if exist('dat1','var')==0 || exist('dat2','var')==0 
    hhbd=msgbox('The data are incomplete. Please load the data 1 and dat a2');
    msgboxFontSize(hhbd,12);
    clear('hhbd','ans')
    clc
    close all
    A_start;
end


sigma_factor=3.0;
poiss_factor=1.0;
min_element=15;
poiss_met=1;
norm_pdf1=0;





if exist('N2or','var')== 0
    N1or=N1;
    dat1or=dat1;
    N2or=N2;
    dat2or=dat2;
end
stop
if exist('Z2ori','var')== 0
tic
Nmaxor=70000;
if N1or <= Nmaxor && N2or > Nmaxor
    dato1=dat1or;
    dato2 = data_reduction(dat2or,Nmaxor,N2or);
    disp(['Data reduction to ',num2str(Nmaxor)])
elseif N1or > Nmaxor && N2or <= Nmaxor
    dato2=dat2or;
    dato1 = data_reduction(dat1or,Nmaxor,N1or);  
    disp(['Data reduction to ',num2str(Nmaxor)])

elseif N1or > Nmaxor && N2or > Nmaxor
    dato1 = data_reduction(dat1or,Nmaxor,N1or);  
    dato2 = data_reduction(dat2or,Nmaxor,N2or);
     disp(['Data reduction to ',num2str(Nmaxor)])

else
     dato1=dat1or;
     dato2=dat2or;
end

pos1ori=[dato1(:,xi1),dato1(:,yi1),dato1(:,zi1)]; 
pos2ori=[dato2(:,xi2),dato2(:,yi2),dato2(:,zi2)];
pos1ori(:,3)=pos1ori(:,3)+2000;
pos2ori(:,3)=pos2ori(:,3)+2000;


disp('Distance tree calculation. Please wait')
a_info_datprep;

Z1ori=Z_calcul(pos1ori);
Z2ori=Z_calcul(pos2ori);

TEST_R=a_ripley_test(dato1,dato2,size(dato1,1),size(dato2,1),xi1,yi1,zi1,xi2,yi2,zi2);
clear('dato1','dato2')
toc

Rsize=round((TEST_R(6)+TEST_R(7))/2);
toc
else
 dato1=dat1or;
 dato2=dat2or;
 pos1ori=[dato1(:,xi1),dato1(:,yi1),dato1(:,zi1)]; 
 pos2ori=[dato2(:,xi2),dato2(:,yi2),dato2(:,zi2)];
 pos1ori(:,3)=pos1ori(:,3)+2000;
 pos2ori(:,3)=pos2ori(:,3)+2000;
 Rsize=round((TEST_R(6)+TEST_R(7))/2);
end
clear('dato1','dato2')
%%%%%%%%%%%%%%%%%%%%%%%%%%%%% parameter %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

size_rys=round(Rsize*2.5);


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


disp('Clustering. Please wait')
kt1rys = cluster(Z1ori,'cutoff',size_rys,'criterion','distance');
kt2rys = cluster(Z2ori,'cutoff',size_rys,'criterion','distance');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% SAMPLE 1 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 


Mddd=max(pos1ori);
mddd=min(pos1ori);
deltaddd=Mddd-mddd;




cluster_main=[];

clind=0;
for ii=1:max(kt1rys)
    ep=find(kt1rys==ii);
   if numel(ep) > min_element %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
     clind=clind+1;
     dd00=pos1ori(ep,:);
     cluster_main(clind,1)=ii;
     cluster_main(clind,2:4)=mean(dd00);
     [muhat,sigmahat] = normfit(dd00);
     cluster_main(clind,5:7)=muhat;
     cluster_main(clind,8:10)=sigmahat;
     wu=poissfit(dd00);
         if wu(:,3)<=0
             wu(:,3)=-wu(:,3);
         end
     cluster_main(clind,11:13)=wu;
     cluster_main(clind,14)=numel(ep);
    end  
end

nnn=size(cluster_main,1);
[muhat,sigmahat] = normfit(cluster_main(:,2:4));
sigmahat=sigmahat*sigma_factor;




rrr=[];
if norm_pdf1==1
for i=1:nnn
  rrr(i,:)=normrnd(muhat,sigmahat) ; 
 if rrr(i,1)< mddd(:,1)
    rrr(i,1)= mddd(:,1)+deltaddd(:,1)*rand; 
 elseif rrr(i,1)> Mddd(:,1)
    rrr(i,1)=Mddd(:,1)-deltaddd(:,1)*rand;
 end
 if rrr(i,2)<mddd(:,2)
  rrr(i,2)=mddd(:,2)+deltaddd(:,2)*rand;
  elseif rrr(i,2)>Mddd(:,2)
  rrr(i,2)=Mddd(:,2)-deltaddd(:,1)*rand;
 end
  if rrr(i,3)<mddd(:,3)
  rrr(i,3)=mddd(:,3)+deltaddd(:,3)*rand;
  elseif rrr(i,3)>Mddd(:,3)
  rrr(i,3)=Mddd(:,3)-deltaddd(:,3)*rand;
 end
end
else
 xu=cluster_main(:,2);    
 xw=emprand(xu,nnn,1);   
 rrr(:,1)=xw;
 xu=cluster_main(:,3);    
 xw=emprand(xu,nnn,1);   
 rrr(:,2)=xw;
 xu=cluster_main(:,4);    
 xw=emprand(xu,nnn,1);   
 rrr(:,3)=xw;
 clear('xu','xw')
end
 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



%%%%%%%%%%%%%%%%%%%%%%%%%Generator%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
KL=0;
SYR=[];
for k=1:nnn
nn00=cluster_main(k,14);
wu=cluster_main(k,11:13);
sigmahat=cluster_main(k,8:10);
muhat=cluster_main(k,5:7);
KL=KL+nn00;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
r00=[];
for j=1:nn00
    if poiss_met==1
        r00(j,:)= poissrnd(wu*poiss_factor);
    else
        r00(j,:)= normrnd(muhat,sigmahat/sigma_factor); 
    end
end
sss=mean(r00);
de=rrr(k,:)-sss;
r00=r00+de;
SYR=[SYR',r00']';
end


UK=N1or;
UK=UK-KL;
if UK>0
    urr=[];
    for kk=1:UK
       urr(kk,:) = mddd+deltaddd.*rand(1,3);
    end
    SYR=[SYR',urr']';
end

SYR(:,1)=max(SYR(:,1),mddd(1,1));
SYR(:,1)=min(SYR(:,1),Mddd(1,1));

SYR(:,2)=max(SYR(:,2),mddd(1,2));
SYR(:,2)=min(SYR(:,2),Mddd(1,2));

SYR(:,3)=max(SYR(:,3),mddd(1,3));
SYR(:,3)=min(SYR(:,3),Mddd(1,3));

pos1ori(:,3)=pos1ori(:,3)-2000;
SYR(:,3)=SYR(:,3)-2000;







clear('datran');
datran=dat1or;                 
datran(:,xi1)=SYR(:,1);
datran(:,yi1)=SYR(:,2);
datran(:,zi1)=SYR(:,3);


ddat1=datran;
ddat2=dat1or;
exname=exname1;
NN1=size(datran,1);
NN2=size(ddat2,1);
A_plot_random_pair;

%%%%%%%%%%%%%%%%%%%%%%%%%% save random sample1 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%
try
load(fullpath1);
par.pkmatrix=datran;
tekst1=['Random_',exname1,'.mat'];
tekst=[dirname1,tekst1];
save(tekst,'par')
clear('par','tekst','tekst1')
catch
clear('par','tekst','tekst1')
msgbox('Fullpath1 is not correct. Please check the first sample name')
clc
A_start;
end










%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%     SAMPLE 2       %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
Mddd=max(pos2ori);
mddd=min(pos2ori);
deltaddd=Mddd-mddd;




cluster_main=[];

clind=0;
for ii=1:max(kt2rys)
    ep=find(kt2rys==ii);
   
 if numel(ep) >min_element %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
     clind=clind+1;
     dd00=pos2ori(ep,:);
     cluster_main(clind,1)=ii;
     cluster_main(clind,2:4)=mean(dd00);
     [muhat,sigmahat] = normfit(dd00);
     cluster_main(clind,5:7)=muhat;
     cluster_main(clind,8:10)=sigmahat;
     wu=poissfit(dd00);
         if wu(:,3)<=0
             wu(:,3)=-wu(:,3);
         end
     cluster_main(clind,11:13)=wu;
     cluster_main(clind,14)=numel(ep);
 end  
end

nnn=size(cluster_main,1);
[muhat,sigmahat] = normfit(cluster_main(:,2:4));
sigmahat=sigmahat*sigma_factor;


rrr=[];
if norm_pdf1==1
for i=1:nnn
  rrr(i,:)=normrnd(muhat,sigmahat) ; 
 if rrr(i,1)< mddd(:,1)
    rrr(i,1)= mddd(:,1)+deltaddd(:,1)*rand; 
 elseif rrr(i,1)> Mddd(:,1)
    rrr(i,1)=Mddd(:,1)-deltaddd(:,1)*rand;
 end
 if rrr(i,2)<mddd(:,2)
  rrr(i,2)=mddd(:,2)+deltaddd(:,2)*rand;
  elseif rrr(i,2)>Mddd(:,2)
  rrr(i,2)=Mddd(:,2)-deltaddd(:,1)*rand;
 end
  if rrr(i,3)<mddd(:,3)
  rrr(i,3)=mddd(:,3)+deltaddd(:,3)*rand;
  elseif rrr(i,3)>Mddd(:,3)
  rrr(i,3)=Mddd(:,3)-deltaddd(:,3)*rand;
 end
end
else
 xu=cluster_main(:,2);    
 xw=emprand(xu,nnn,1);   
 rrr(:,1)=xw;
 xu=cluster_main(:,3);    
 xw=emprand(xu,nnn,1);   
 rrr(:,2)=xw;
 xu=cluster_main(:,4);    
 xw=emprand(xu,nnn,1);   
 rrr(:,3)=xw;
 clear('xu','xw')
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
KL=0;
SYR=[];
for k=1:nnn
nn00=cluster_main(k,14);
wu=cluster_main(k,11:13);
sigmahat=cluster_main(k,8:10);
muhat=cluster_main(k,5:7);
KL=KL+nn00;
r00=[];
for j=1:nn00
    if poiss_met==1
        r00(j,:)= poissrnd(wu*poiss_factor);
    else
        r00(j,:)= normrnd(muhat,sigmahat/sigma_factor); 
    end
end

sss=mean(r00);
de=rrr(k,:)-sss;
r00=r00+de;
SYR=[SYR',r00']';
end

UK=N2or;
UK=UK-KL;

if UK>0
    urr=[];
    for kk=1:UK
       urr(kk,:) = mddd+deltaddd.*rand(1,3);
    end
    SYR=[SYR',urr']';
end
SYR(:,1)=max(SYR(:,1),mddd(1,1));
SYR(:,1)=min(SYR(:,1),Mddd(1,1));

SYR(:,2)=max(SYR(:,2),mddd(1,2));
SYR(:,2)=min(SYR(:,2),Mddd(1,2));

SYR(:,3)=max(SYR(:,3),mddd(1,3));
SYR(:,3)=min(SYR(:,3),Mddd(1,3));

pos2ori(:,3)=pos2ori(:,3)-2000;
SYR(:,3)=SYR(:,3)-2000;

%figure
%whitebg('w')
%plot(pos2ori(:,1),pos2ori(:,2),'.g','Markersize',3.5)
%hold on
%plot(SYR(:,1),SYR(:,2),'.b','Markersize',0.5)
%title('Sample 2')


clear('datran')
datran=dat2or; 
datran(:,xi1)=SYR(:,1);
datran(:,yi1)=SYR(:,2);
datran(:,zi1)=SYR(:,3);

%%%%%%%%%%%%%%%%%%%%%%%%%% figure
ddat1=datran;
ddat2=dat2or;
exname=exname2;
NN1=size(datran,1);
NN2=size(ddat2,1);
A_plot_random_pair;
%%%%%%%%%%%%%%%%%%%%%%%%%% save sample 2
try
load(fullpath2);
par.pkmatrix=datran;
exn2 = strrep(exname2,'-','_');
tekst1=['Random_',exname2,'.mat'];
tekst=[dirname2,tekst1];
save(tekst,'par')
clear('par','tekst','tekst1')
catch
 clear('par','tekst','tekst1')
msgbox('Fullpath2 is not correct. Please check the second sample name')
clc
A_start;   
end    
    
a_info_save_random;



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


clear('Z2ori','Z1ori','cluster_main','SYR','Mddd','mddd', 'rrr','size_rys',...
    'deltaddd', 'nnn', 'nn00', 'de', 'sss', 'dd00','kt2rys','Nmaxor',...
    'ep' ,'KL','wu', 'r00', 'muhat','sigmahat','UK', 'urr', 'kk', 'i', 'k', 'j','clind','ii','kt1rys',...
    'par','datran','pos1ori','pos2ori','sigma_factor','poiss_factor','norm_pdf1','poiss_met', 'Rsize','NN2',...
    'options','min_element','exname','NN1')






 
 
 
