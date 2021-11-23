clc
rng('default')

if exist('dat','var')==0
    hhbd=msgbox('The data are incomplete. Please load the data for randomizing');
    msgboxFontSize(hhbd,12);
    clear('hhbd','ans')
    clc
    close all
    A_start;
end


sigma_factor=3.0;
poiss_factor=1.0;
stop_random_noise;
poiss_met=1;
norm_pdf1=0;






if exist('Zori','var')== 0
tic
Nmaxor=70000;
if N > Nmaxor
    dato = data_reduction(dat,Nmaxor,N);
    disp(['Data reduction to ',num2str(Nmaxor)])
else
    dato=dat;
end

posori=[dato(:,xi),dato(:,yi),dato(:,zi)]; 
posori(:,3)=posori(:,3)+2000;

disp('Distance tree calculation. Please wait')
a_info_datprep;

Zori=Z_calcul(posori);
TEST_R=a_ripley_test(dato,dato,size(dato,1),size(dato,1),xi,yi,zi,xi,yi,zi);
clear('dato')
toc

Rsize=round((TEST_R(6)+TEST_R(7))/2);
toc
else
 dato=dat;
 posori=[dato(:,xi),dato(:,yi),dato(:,zi)]; 
 posori(:,3)=posori(:,3)+2000;
 Rsize=round((TEST_R(6)+TEST_R(7))/2);
end
clear('dato')
%%%%%%%%%%%%%%%%%%%%%%%%%%%%% parameter %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

size_rys=round(Rsize*2.5);


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


disp('Clustering. Please wait')
ktrys = cluster(Zori,'cutoff',size_rys,'criterion','distance');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% SAMPLE 1 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 


Mddd=max(posori);
mddd=min(posori);
deltaddd=Mddd-mddd;
cluster_main=[];
clind=0;
for ii=1:max(ktrys)
    ep=find(ktrys==ii);
   if numel(ep) > min_element %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
     clind=clind+1;
     dd00=posori(ep,:);
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


UK=N;
UK=UK-KL;

if UK>0
    urr=[];
    for kk=1:UK
       if noi==1
       urr(kk,:) = mddd+deltaddd.*rand(1,3);
       elseif noi==0
      
       urr(kk,:) = mddd+deltaddd.*0;     
       end  
    end
    SYR=[SYR',urr']';
end

SYR(:,1)=max(SYR(:,1),mddd(1,1));
SYR(:,1)=min(SYR(:,1),Mddd(1,1));

SYR(:,2)=max(SYR(:,2),mddd(1,2));
SYR(:,2)=min(SYR(:,2),Mddd(1,2));
SYR(:,3)=SYR(:,3)+100;
SYR(:,3)=max(SYR(:,3),mddd(1,3));
SYR(:,3)=min(SYR(:,3),Mddd(1,3));

posori(:,3)=posori(:,3)-2000;
SYR(:,3)=SYR(:,3)-2000;







clear('datran');
datran=dat;                 
datran(:,xi)=SYR(:,1);
datran(:,yi)=SYR(:,2);
datran(:,zi)=SYR(:,3);


ddat1=datran;
ddat2=dat;
NN1=size(datran,1);
NN2=size(ddat2,1);



A_plot_random_pair;

%%%%%%%%%%%%%%%%%%%%%%%%%% save random sample1 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%
try
load(fullpath);
par.pkmatrix=datran;
tekst1=['Random_',pathname];
tekst=[dirname,tekst1];
save(tekst,'par')
%clear('par','tekst','tekst1','fullpath','dirname','datran')
catch
clear('par','tekst','tekst1')
msgbox('Fullpath is not correct. Please check the first sample name')
clc
A_start;
end




clear('Zori','cluster_main','SYR','Mddd','mddd', 'rrr','size_rys',...
    'deltaddd', 'nnn', 'nn00', 'de', 'sss', 'dd00','ktrys','Nmaxor',...
    'ep' ,'KL','wu', 'r00', 'muhat','sigmahat','UK', 'urr', 'kk', 'i', 'k', 'j','clind','ii','ktrys',...
    'par','datran','posori','sigma_factor','poiss_factor','norm_pdf1','poiss_met', 'Rsize','NN2',...
    'options','min_element','exname','NN1')

clear('colhead', 'dat' ,'fri' ,'ini' ,'lasti' ,'hh', 'N' ,'pathname', 'posori','rgfi','rgi' ,'rgsi' ,'sfrM', 'sxi' ,'szi',...
'xi', 'yi' ,'zi') 

msgbox('Random sample is saved')