%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
rng('default');
%locall=1;

NM = max(N1,N2);
Nm = min(N1,N2);
Nmin=Nm;
A_warnung_small_sample;

if Nm <= 200
    A_warnung_small_sample; %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif Nm <= 1000
    M=round(0.9*Nm);
    disp('Number of points is smaller as 1000');
elseif Nm <= 3000
    M=min(S_size,Nm);
elseif Nm > 3000 && Nm < 100000
    M=min(S_size,Nm);
else
    M=S_size;
end
disp(['Size of resample ',num2str(M),' points'])
disp('--------------------------------------------------------------')

pos1tem=[dat1(:,xi1),dat1(:,yi1),dat1(:,zi1)];
pos2tem=[dat2(:,xi2),dat2(:,yi2),dat2(:,zi2)];

rtest1=radius_test(pos1tem);
rtest2=radius_test(pos2tem);
rtest=min(rtest1,rtest2);
rtest=0.333333*rtest;
rtest=round(rtest);
disp(['Sample1 dimension ',num2str(rtest1),'; Sample2 dimension ',num2str(rtest2),' nm'])

disp([ 'Recommended max clustering-radius ',num2str(rtest),' nm'])
clear('rtest1','rtest2','rtest','dato1','dato2','pos1tem','pos2tem')

rmax=Rmax;
disp(['Radius given ',num2str(Rmax),' nm'])
dist=5:step_clustering:rmax;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear('K_Array1','L1_Array1')
clear('K_Array2','L1_Array2')
clear('CN_Array1','CN_Array2')

K_Array1(1:numel(dist),1:A)=0;
L1_Array1(1:numel(dist),1:A)=0;

K_Array2(1:numel(dist),1:A)=0;
L1_Array2(1:numel(dist),1:A)=0;

CN_Array1(1:numel(dist),1:A)=0;
CN_Array2(1:numel(dist),1:A)=0;

E=(4*pi*dist.^3)/3;


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% main loop %%%%%%%%%%%%%%%%%%%%%%%
wait_h = uiprogressdlg(settings.SeriesUIFigure,...
    'Title','Analysis Ripley 3D',...
    'Message','Sampling and Ripley 3D calculation...');

for i=1:A
    wait_h.Value = i/A;
    dato1 = data_reduction(dat1,M,N1);
    dato2 = data_reduction(dat2,M,N2);
    
    pos1=[dato1(:,xi1),dato1(:,yi1),dato1(:,zi1)];
    [d1,rmin_avg1,box_ripl1]=dist_min(pos1);
    
    pos2=[dato2(:,xi2),dato2(:,yi2),dato2(:,zi2)];
    [d2,rmin_avg2,box_ripl2]=dist_min(pos2);
    
    K1 = RipleysK3D(pos1,d1,dist,box_ripl1,2);
    K2 = RipleysK3D(pos2,d2,dist,box_ripl2,2);
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    COR1 = Concentration3D(pos1,dist);
    COR2 = Concentration3D(pos2,dist);
    
    %%%%%%%%%%%%%%%%%%%%%%% H function %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    [N11,~] = size(pos1);
    [~,v] = convhulln(pos1);
    lambda1r = N11/v;
    [N22,~] = size(pos2);
    [~,v] = convhulln(pos2);
    lambda2r = N22/v;
    clear('v')
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    K_Array1(:,i)=K1;
    K_Array2(:,i)=K2;
    K1=K1/lambda1r ;          %lambda1_g;
    K2=K2/lambda2r ;          %lambda2_g;
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    L11=nthroot((3*K1)/(4*pi),3)-dist';
    L12=nthroot((3*K2)/(4*pi),3)-dist';
    L1_Array1(:,i)=L11;
    L1_Array2(:,i)=L12;
    
    
    CN_Array1(:,i)=COR1;
    CN_Array2(:,i)=COR2;
end

close(wait_h)

if A>1
    [pa,~,P]=averagepval(K_Array1,K_Array2);
    PP=mean(P')';
    
    km1=mean(K_Array1');
    km2=mean(K_Array2');
    lm1=mean(L1_Array1');
    lm2=mean(L1_Array2');
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% max H %%%%%%%%%%%
    ep=find(lm1==max(lm1));
    maxH1=dist(ep);
    ep=find(lm2==max(lm2));
    maxH2=dist(ep);
    cn1=mean(CN_Array1');
    cn2=mean(CN_Array2');

    alp=0.05;

    [pval1,~,~]=pval(km1,K_Array2',dist,2e+3);
    [pval2,~,~]=pval(km2,K_Array1',dist,2e+3);
    
    pvalm=[pval1',pval2']';
    pvalM=mean(pvalm);
    ppval=mean(pvalM);
    
    [pval1]=pvalKS(km1,K_Array2);
    [pval2]=pvalKS(km2,K_Array1);
    pvalm=[pval1,pval2]';
    pvalMKS=mean(pvalm);
    [pvalMM,~,~]= and_term(pvalMKS',pvalM',0.3);

    [pvcn1,~,~]=pval(cn1,CN_Array2',dist,2e+3);
    [pvcn2,~,~]=pval(cn2,CN_Array1',dist,2e+3);
    
    pvcnm=[pvcn1',pvcn2']';
    pvcnM=mean(pvcnm);
    
    [pvcn1]=pvalKS(cn1,CN_Array2);
    [pvcn2]=pvalKS(cn2,CN_Array1);
    pvcnm=[pvcn1,pvcn2]';
    pvalCMKS=mean(pvcnm);
    [pvalCMM,~,~]= and_term(pvalCMKS',pvcnM',0.3);
    all_delta_start;

    [tpw,apw,mpw]= and_term(PP,pvalM',0.3);
    all_ks_ripl(:,gindex)=tpw;
    
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
    clear('PK_Array1','PK_Array2')
    PK_Array1(1:numel(dist),1:A)=0;
    PK_Array2(1:numel(dist),1:A)=0;

    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    for i=1:A
        
        pvalt=pvalKS(K_Array1(:,i),K_Array2);
        PK_Array1(:,i)=pvalt;
        pvalt=pvalKS(K_Array2(:,i),K_Array1);
        PK_Array2(:,i)=pvalt;
    end
    clear('pvalt')
    
    
    UU=0.5*PK_Array1+0.5*PK_Array2;
    
    [CIripK,~]=CI_calcul_rapid(UU,alp,1);
    
    KSTD=std(UU');
    KSTD=KSTD/sqrt(A);
    kst=mean(KSTD);
    
    lok=tpw-1.4*CIripK(:,4);
    %lok=tpw-1.96*KSTD';
    ep=find(lok<0);
    lok(ep)=0;
    upk=tpw+CIripK(:,5);
    %upk=tpw'+1.96*KSTD';
    ep=find(upk>1);
    upk(ep)=1;
    
    simripK=a_similarity_M(mpw,alp);
    [simriplK,simlvk] = a_similarity_L(lok,upk,tpw,alp);
    
    %%%%%%%%%%%%%%%%%%%%%%%%% update test %%%%%%%%%%%%%%%
    if mpw>alp
        simili=1;
    else
        simili=-1;
    end
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %TEST_R=[mpw,apw,simili,simriplK,simlvk]
    
    attn_save_ripl_plot;
    
    %%%%%%%%%%%%%%%%%%%%%figures%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %rys_ripl_empir;
    %rys_ripley_empiricp;
    %tt_rys_resam_gen_ripley;
    %rys_ripl_total;
    
else
    [~,p_val_K_singel,~ ]=kstest2(K1,K2);
    p_val_W_singel=ranksum(K1,K2);
    rip_ks= p_val_K_singel;
    rip_w=p_val_W_singel;
    rip_M=A;
    clear('rip_PVMR')
    attn_res_ri_single;
    
    clear('p_val_W_singel' ,'p_val_K_singel')
end
try
    close(hh1)
    clear('hh1')
catch
    clear('hh1')
    %clc
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
Sim_ripley_M(iw,kw)=simripK;
Sim_ripley_L(iw,kw)=simriplK;
Sim_ripley_AVP(iw,kw)=mpw;

clear('CI','P','rmin_avg1','rmin_avg2','apw','av_tot','avg_pm','avg_pmc','CIMR','CIMRc','crm','dis','dowait','ep','filtruj','kst','locall','lok',...
    'pa','plae','plas','PLripL','PPripK','ppval','PripK','PripL','pval1', 'pval2','pvalm','pvalM','PVMR','PVMRc','ripl',...
    'PVR', 'PVRc','simili','siml_r','simlc_r','simripK','simriplK','upk','UU',...
    'simlvk','simm_r','simmc_r','zero','lm1','lm2')


clear('av_tot','avg_pm', 'avg_pmc','CI','CIMR', 'CIMRc', 'CIripK' ,'crm', 'dis', 'lm1', 'lm2', 'Nmin',...
    'options',  'PVMR' ,'PVMRc', 'PVR', 'PVRc',...
    'siml_r', 'simlc_r', 'simm_r', 'simmc_r' ,'zero')



