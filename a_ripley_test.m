function TEST_R=a_ripley_test(dat1,dat2,N1,N2,xi1,yi1,zi1,xi2,yi2,zi2)
clc

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
rng('default');
locall=1;
A=100;


Nm = min(N1,N2);
Nmin=Nm;
if Nm <= 100
    Stop_to_small_sample
    %answer_too_small_region; %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif Nm <= 1000
    M=round(0.8*Nm);
elseif Nm <= 2000
    M=800;
else
    M=1000;
end

%disp('Please wait: Ripley test')

dato1 = data_reduction(dat1,M,N1);
dato2 = data_reduction(dat2,M,N2);
pos1tem=[dato1(:,xi1),dato1(:,yi1),dato1(:,zi1)];
pos2tem=[dato2(:,xi2),dato2(:,yi2),dato2(:,zi2)];

rtest1=radius_test(pos1tem);
rtest2=radius_test(pos2tem);
rtest=min(rtest1,rtest2);

rmax=round(rtest*0.5);
if rmax < 1000
   rmax=1000;
end

dist=5:10:rmax;

clear('rtest1','rtest2','rtest','dato1','dato2','pos1tem','pos2tem','Nm','NM')
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear('K_Array1','L1_Array1')
clear('K_Array2','L1_Array2')

K_Array1(1:numel(dist),1:A)=0;
L1_Array1(1:numel(dist),1:A)=0;
K_Array2(1:numel(dist),1:A)=0;
L1_Array2(1:numel(dist),1:A)=0;

%E=(4*pi*dist.^3)/3;


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% main loop %%%%%%%%%%%%%%%%%%%%%%%
tic
for i=1:A

dato1 = data_reduction(dat1,M,N1);
dato2 = data_reduction(dat2,M,N2);

pos1=[dato1(:,xi1),dato1(:,yi1),dato1(:,zi1)];
[d1,rmin_avg1,box_ripl1]=dist_min(pos1);

pos2=[dato2(:,xi2),dato2(:,yi2),dato2(:,zi2)];
[d2,rmin_avg2,box_ripl2]=dist_min(pos2);

K1 = RipleysK3D(pos1,d1,dist,box_ripl1,2);
K2 = RipleysK3D(pos2,d2,dist,box_ripl2,2);
L11=nthroot((3*K1)/(4*pi),3)-dist';
L12=nthroot((3*K2)/(4*pi),3)-dist';
% L11=K1-E';
 %L12=K2-E';

K_Array1(:,i)=K1;
L1_Array1(:,i)=L11;

K_Array2(:,i)=K2;
L1_Array2(:,i)=L12;

end

%%%%%%%%%%%%%%%%%%%% p-values %%%%%%%%%%%%%%%%%%%%%%
[pa,RE,P]=averagepval(K_Array1,K_Array2);
PP=mean(P')';
toc

km1=mean(K_Array1');
km2=mean(K_Array2');
lm1=mean(L1_Array1');
lm2=mean(L1_Array2');

ep=find(lm1==max(lm1),1,'first');
maxH1=dist(ep);
ep=find(lm2==max(lm2),1,'first');
maxH2=dist(ep);


alp=0.05;
[~,pke,~ ]=kstest2(km1,km2);

[pval1,~,~]=pval(km1,K_Array2',dist,2e+3);
[pval2,~,~]=pval(km2,K_Array1',dist,2e+3);

pvalm=[pval1',pval2']';
pvalM=mean(pvalm);
ppval=mean(pvalM);


%%%%%%%%%%%%%%%%%%%%%% t-norm %%%%%%%%%%%%%%%
[tpw,apw,mpw]= and_term(PP,pvalM',0.7);

gre_real=mean(std(pvalm));

if mpw>alp
    simili=1;
else
    simili=-1;
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
for i=1:A

pvalt=pvalKS(K_Array1(:,i),K_Array2);
           PK_Array1(:,i)=pvalt';
pvalt=pvalKS(K_Array2(:,i),K_Array1);
           PK_Array2(:,i)=pvalt';
end
clear('pvalt')

UU=0.5*PK_Array1+0.5*PK_Array2;
[CIripK,~]=CI_calcul_rapid(UU,alp,1);

KSTD=std(UU');
KSTD=KSTD/sqrt(A);

lok=tpw-CIripK(:,4);
%lok=tpw-1.96*KSTD';
ep=find(lok<0);
lok(ep)=0;
upk=tpw+CIripK(:,5);
%upk=tpw'+1.96*KSTD';
ep=find(upk>1);
upk(ep)=1;

simripK=a_similarity_M(mpw,alp);
[simriplK,simlvk] = a_similarity_L(lok,upk,tpw,alp);



simlk0=simlvk;
simlk=simriplK;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
TEST_R=[mpw,gre_real,simili,simlk,simlk0,maxH1,maxH2];
end


