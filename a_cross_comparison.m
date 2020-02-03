
function [PV,CI,PVM,CIM,simm,siml]=a_cross_comparison(AR1,AR2,test_no,dist,alf)





disp('Cross comparison. Please wait')
L=size(AR1,1);   %%%%%% sizes of  cluster
M=size(AR2,2);  %%%%%%%%% number of resamples



clear('TEM1')
clear('TEM2')
TEM1(1:L,1:test_no)=0;
TEM2(1:L,1:test_no)=0;
clear('TEM3')
clear('TEM4')
TEM3(1:L,1:test_no)=0;
TEM4(1:L,1:test_no)=0;
%%%%%%%%%%%%%%%%%%%%%%%%%%%% mean comparison %%%%%%%%%%%%%%%%%%%
mu1=mean(AR1');
[pmu1,~,~]=pval(mu1,AR2',dist,1e+4);
pmu1=pmu1';
%pmk1=pvalKS(mu1',AR2);
%if isnan(pmk1)==1
%    pmk1=0;
%end


mu2=mean(AR2');
[pmu2,~,~]=pval(mu2,AR1',dist,1e+4);
pmu2=pmu2';
%pmk2=pvalKS(mu2',AR1);
%if isnan(pmk2)==1
%   pmk2=0;
%end

 
pmu=median([pmu1,pmu2]')';
%pmk=mean([pmk1,pmk2]')';

[pm,~,mpmm]= and_term(pmu,pmu,0.5);  %%%%%%%%%%%%%%%% mean2all


%%%%%%%%%%%%%%%%%%% cross comparison %%%%%%%%%%%%%%%%%%%%%%

for i= 1:test_no
   rr=randi(M);
   [pval_tem,~,~]=pval(AR1(:,rr)',AR2',dist,2e+3);
   %pval_tem=pvalKS(AR1(:,rr),AR2);
   TEM1(:,i)=pval_tem';
   pval_t=pvalKS(AR1(:,rr),AR2);
   TEM2(:,i)=pval_t';
    rr=randi(M);
   [pva2_tem,~,~]=pval(AR2(:,rr)',AR1',dist,2e+3);
    %pva2_tem=pvalKS(AR2(:,rr),AR1);
   TEM3(:,i)=pva2_tem';
   pva2_t=pvalKS(AR2(:,rr),AR1);
   TEM4(:,i)=pva2_t';
end
 w=0.9;
 UU1=w*TEM1+(1-w)*TEM2;
[CINZ,~]=CI_calcul_rapid(UU1,alf,1);


pval_cross=CINZ(:,3);
pval_cross_ks=CINZ(:,3);
std_cross_lo=CINZ(:,4);
std_cross_up=CINZ(:,5);


 UU2=w*TEM3+(1-w)*TEM4;
[CINZ,~]=CI_calcul_rapid(UU2,alf,1);

pva2_cross=CINZ(:,3);
pva2_cross_ks=CINZ(:,3);
std_cross_lo2=CINZ(:,4);
std_cross_up2=CINZ(:,5);

pval_cross=mean([pval_cross,pva2_cross]')';
std_cross_lo = median([std_cross_lo,std_cross_lo2]')';
std_cross_up = median([std_cross_up,std_cross_up2]')';






PV=pval_cross;
PVM=pm;


lo=PV-std_cross_lo;
up=PV+std_cross_up;
lo=max(0,lo);
up=min(1,up);

CI=[lo,up];

lom=pm-std_cross_lo;
upm=pm+std_cross_up;
lom=max(0,lom);
upm=min(1,upm);
CIM=[lom,upm];

clear('TEM1')
clear('TEM2')
clear('TEM3')
clear('TEM4')

simm=a_similarity_M(mpmm,alf);
[siml,simlv] = a_similarity_L(lom,upm,pm,alf);

figu=0;
if figu == 1
    figure
   
    plot(PV,'-r')
    hold on 
    plot(CI(:,1),':r')
    plot(CI(:,2),':r')
    plot(PVM,'-b')
    plot(CIM(:,1),':b')
    plot(CIM(:,2),':b')
end


end


