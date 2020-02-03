

clear('PP_Array1','PP_Array2')
clear('CP_Array1','CP_Array2')
%%%%%%%%%%%%%%%%%%%%%% 
tic
disp('CI for p-value calculation')

[tpwg,apwg,mpwg]= and_term(tpwcr,tpwc,0.7);
 


%%%%%%%%%%%%%%%%  cross full between PR and CU kstest 





PP_Array1(1:numel(dist),1:A)=0;
PP_Array2(1:numel(dist),1:A)=0;
CP_Array1(1:numel(dist),1:A)=0;
CP_Array2(1:numel(dist),1:A)=0;



for i=1:A
  
    pvalt=pvalKS(PR_Array1(:,i),PR_Array2);
           PP_Array1(:,i)=pvalt';
    pvalt=pvalKS(PR_Array2(:,i),PR_Array1);
           PP_Array2(:,i)=pvalt';
    cvalt=pvalKS(CU_Array1(:,i),CU_Array2);
           CP_Array1(:,i)=cvalt';
    cvalt=pvalKS(CU_Array2(:,i),CU_Array1);
           CP_Array2(:,i)=cvalt';
end
clear('pvalt','cvalt')

UU=0.25*PP_Array1+0.25*PP_Array2+0.25*KD_Array+0.25*KDR_Array;
CW=0.2*CP_Array1+0.2*CP_Array2+0.3*KC_Array+0.3*KCR_Array;
[CIPR,~]=CI_calcul_rapid(UU,alp,1);
[CICU,~]=CI_calcul_rapid(CW,alp,1);

%ST=std(UU');
%CT=std(CW');
%[TSTD,atstd,mtstd]= and_term(ST',CT',0.8);
clear('UU','CW')
lo_s=and_term(CIPR(:,4),CICU(:,4),0.7);
up_s=and_term(CIPR(:,5),CICU(:,5),0.7);




lo=tpwg-1.2*lo_s;
ep=find(lo<0);
lo(ep)=0;
up=tpwg+up_s;
ep=find(up>1);
up(ep)=1;






simmg=a_similarity_M(mpwg,alp);
[simlg,simlvg] = a_similarity_L(lo,up,tpwg,alp);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
toc
fig=0;
if fig==1
clear('crlo','crup','crtpw')
crlo(1:numel(dist))=mean(lo);
crup(1:numel(dist))=mean(up);
crtpw(1:numel(dist))=mpwg;
cr0(1:numel(dist))=alp;
figure
plot(up,'-r')
hold on
plot(tpwg,'-b');
plot(lo,'-m');
plot(ss,'-k')
plot(crlo,'--k')
plot(crup,'--k')
plot(crtpw,'-b')
end
