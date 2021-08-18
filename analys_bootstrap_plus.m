clc
close all
pause(0.01)
locall=1;
%%%%%%%% data test 


if exist('dat1','var')==0  || exist('dat2','var')==0
    a_info_load;
    A_start;
else
    if isempty(dat1)==1 || isempty(dat2)==1
        a_info_load;
        A_start;
    end
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

mu_1=0;
st_1=0;
mu_2=0;
st_2=0;
A_warnung_small_sample;



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
rng('default');
if exist('TEST_R','var')==0
TEST_R=[0.0,0.0,0,0.05,0.05,250,150];
end
clear('hhh')


NM = max(N1,N2);
Nm = min(N1,N2);
Nmin=Nm;





answer1;


if Nm <= 200
      A_warnung_small_sample; %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif Nm <= 1000
      M=round(0.8*Nm);
elseif Nm <= 3000
      M=min(S_size,Nm);
elseif Nm > 3000 && Nm < 100000
      M=min(S_size,Nm);
else
      M=S_size;
end
%%%%%%%%%%%%%%%%%%%%%%%%factor for min dist calculation%%%%%%%%%%%%%%%%

if M<20000
    grose=0;
    disp('density calculation-bullet sum')
    else
    grose=1;
    disp('density calculation-mixed')
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

dato1 = data_reduction(dat1,M,N1);
dato2 = data_reduction(dat2,M,N2);
pos1tem=[dato1(:,xi1),dato1(:,yi1),dato1(:,zi1)];
pos2tem=[dato2(:,xi2),dato2(:,yi2),dato2(:,zi2)];

if grose==1
[VS1,la1,adist1,stddist1,midi1]=D3_sample_preparation_plus(pos1tem);
[VS2,la2,adist2,stddist2,midi2]=D3_sample_preparation_plus(pos2tem);
mu_1=0.5*adist1;
st_1=0.25*stddist1;
mu_2=0.5*adist2;
st_2=0.25*stddist2;
end


%%%%%%%%%%%%%%%%%%%%%%%%%%%% max radius of clusters %%%%%%%%%%%%%%%%%%%%%%%%

rtest1=radius_test(pos1tem);
rtest2=radius_test(pos2tem);
rtest=min(rtest1,rtest2);

clear('dist')
if locall ==1
    rmax=round(rtest*0.50);
else
    rmax=Rmax;
end

if rmax < 1000
    rmax=1000;
end

dist=5:10:rmax;
U=numel(dist);
clear('rtest1','rtest2','rtest','dato1','dato2','pos1tem','pos2tem','Nm','NM')
answer_time;


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%start%%%%%%%%%%%%
     
clear('PR_Array1','PR_Array2')
clear('CU_Array1','CU_Array2')
clear('KD_Array','KC_Array','KDR_Array','KCR_Array','KCM_Array')

PR_Array1(1:U,1:A)=0; % avg density
PR_Array2(1:U,1:A)=0; % avg density
CU_Array1(1:U,1:A)=0; % avg curvature
CU_Array2(1:U,1:A)=0; % avg curvature

KD_Array(1:U,1:A)=0; % pval KS density
KDR_Array(1:U,1:A)=0; %pval WX density
KC_Array(1:U,1:A)=0;  %pval KS curvature
KCR_Array(1:U,1:A)=0; %pval WX corvature
KCM_Array(1:U,1:A)=0; % pval CM density 


dowait=1;
if dowait==1
wait_h = waitbar(0, 'Resampling and density features calculation...');
end

for k=1:A
   
   display(['sample ',num2str(k),'/',num2str(A)])
   tic
   clear('dato1','dato2')
   dato1 = data_reduction(dat1,M,N1);
   dato2 = data_reduction(dat2,M,N2);
   clear('pos1','pos2')
   pos1=[dato1(:,xi1),dato1(:,yi1),dato1(:,zi1)]; 
   pos2=[dato2(:,xi2),dato2(:,yi2),dato2(:,zi2)];
  
   
   %av_size1=[(max(pos1(:,1))-min(pos1(:,1)))/M,(max(pos1(:,2))-min(pos1(:,2)))/M,(max(pos1(:,3))-min(pos1(:,3)))/M];
   %av_size2=[(max(pos2(:,1))-min(pos2(:,1)))/M,(max(pos2(:,2))-min(pos2(:,2)))/M,(max(pos2(:,3))-min(pos2(:,3)))/M];
   
   if grose==0
    [~,~,mu_1,st_1,midi1]=D3_sample_preparation_plus(pos1);
    [~,~,mu_2,st_2,midi2]=D3_sample_preparation_plus(pos2);
    end
  mu_1=0.4*mu_1;
  st_1=0.15*st_1;
  mu_2=0.4*mu_2;
  st_2=0.15*st_2;
 
   lambda_box1=M/((max(pos1(:,1))-min(pos1(:,1)))*(max(pos1(:,2))-min(pos1(:,2)))*(max(pos1(:,3))-min(pos1(:,3)))); 
   lambda_box2=M/((max(pos2(:,1))-min(pos2(:,1)))*(max(pos2(:,2))-min(pos2(:,2)))*(max(pos2(:,3))-min(pos2(:,3))));  
    
 
   Z1=Z_calcul(pos1);
   Z2=Z_calcul(pos2);

 
   for i=1:U
      
     kt1 = cluster(Z1,'cutoff',dist(i),'criterion','distance');
     kt2 = cluster(Z2,'cutoff',dist(i),'criterion','distance');
     
   
    
     [dens1,den_av1,cur1,cur_av1]=feature_dens_primitiv_plus(kt1,pos1,grose,mu_1,st_1,midi1);
     [dens2,den_av2,cur2,cur_av2]=feature_dens_primitiv_plus(kt2,pos2,grose,mu_2,st_2,midi2);
     
     [~,pks1,~]=kstest2(dens1/lambda_box1,dens2/lambda_box2);
     [~,pks2,~]=kstest2(dens1/sum(dens1),dens2/sum(dens2));
        pks=max(pks1,pks2);
     
     
      pkw1=ranksum(dens1/lambda_box1,dens2/lambda_box2);
      pkw2=ranksum(dens1/sum(dens1),dens2/sum(dens2));
      pksw=max(pkw1,pkw2);
      
      [~,pcm1, ~] = cmtest2(dens1/lambda_box1,dens2/lambda_box2 );
      [~,pcm2, ~] = cmtest2(dens1/sum(dens1),dens2/sum(dens2));
      pcmm=min(pcm1,pcm2); 
      pcmm=1-pcmm;
      
      [~,pkc,~]=kstest2(cur1,cur2);
         pkcr=ranksum(cur1,cur2); 
     
     if isnan(pks)==1
         pks=0;
     end
     
     if isnan(pkc)==1
         pkc=1;
     end
     if isnan(pksw)==1
         pksw=0;
     end
     if isnan(pkcr)==1
         pkcr=1;
     end
 %%%%%%%%%%%%%%%% detail level   
    KC_Array(i,k)=pkc;
    KD_Array(i,k)=pks; 
    KCR_Array(i,k)=pkcr;
    KDR_Array(i,k)=pksw;
    KCM_Array(i,k)=pcmm;
  %%%%%%%%%%%%%%%%% general level
  
    PR_Array1(i,k)=den_av1/lambda_box1;
    PR_Array2(i,k)=den_av2/lambda_box2;
    
    %PR_Array1(i,k)=den_av1/sum(dens1);
    %PR_Array2(i,k)=den_av2/sum(dens2);
    
    
    CU_Array1(i,k)=cur_av1;
    CU_Array2(i,k)=cur_av2;
    
  
   end
   if dowait==1
        try
             waitbar(k/A,wait_h);
        catch
             helpdlg('Calculations had been aborted','Waitbar message')
             clear('KD_Array','KDR_Array','PR_Array1','PR_Array2','CU_Array1','CU_Array2')
             clear('KC_Array','KCR_Array')
            return;
        end
    end
 toc
end
if dowait==1
 close(wait_h)
 clear('wait_h')
end

%%%%%%%%%%%%%%%%%%%% end data preparation   
rys_bootstrap; 
%%%%%%%%%%%%%%%%%%%%%%%% ks test %%%%%%%%%%%
[pa,~,P]=averagepval(PR_Array1,PR_Array2);
PP=mean(P')';                       %%%%%%  i-2-i ks  and wilcoxon
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
answer_alpha;


%%%%%%%%%%%%%%%%%%%%%%%% begin analyse detail level
den_ks=mean(KD_Array,2);
den_wilcox=mean(KDR_Array,2);
cur_wilcox=mean(KCR_Array,2);
cur_ks=mean(KC_Array,2);

std_ks=std(KD_Array')';
std_wilcox=std(KDR_Array')';
stc_wilcox=std(KCR_Array')';
stc_ks=std(KC_Array')';


[ci_kd,~]=CI_calcul_rapid(KD_Array,alp,1);
[ci_kdr,~]=CI_calcul_rapid(KDR_Array,alp,1);
[ci_kc,~]=CI_calcul_rapid(KC_Array,alp,1);
[ci_kcr,~]=CI_calcul_rapid(KCR_Array,alp,1);

slo_kd=ci_kd(:,4);
sup_kd=ci_kd(:,5);
slo_kdr=ci_kdr(:,4);
sup_kdr=ci_kdr(:,5);
slo_kc=ci_kc(:,4);
sup_kc=ci_kc(:,5);
slo_kcr=ci_kcr(:,4);
sup_kcr=ci_kcr(:,5);

%%%%%%%%%% KS und Wilcoxon only 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% weight mean od ka  and wilcoxon
[pd,~,mpd] =  and_term(den_ks,den_wilcox,0.85);
[pd_low,~,~] =and_term(slo_kd,slo_kdr,0.75);
[pd_up,~,~] = and_term(sup_kd,sup_kdr,0.75);

[pc,~,mpc] =   and_term(cur_ks,cur_wilcox,0.8);
[pc_low,~,~] = and_term(slo_kc,slo_kcr,0.7);
[pc_up,~,~] =  and_term(sup_kc,sup_kcr,0.7);

lo_den=max(0,pd-pd_low);
up_den=max(0,pd+pd_up);
lo_cur=max(0,pc-pc_low);
up_cur=max(0,pc+pc_up);

sim_mpd=a_similarity_M(mpd,alp);
sim_mpc=a_similarity_M(mpc,alp);
[sim_lpd,simlv_pd] = a_similarity_L(lo_den,up_den,pd,alp);
[sim_lpc,simlv_pc] = a_similarity_L(lo_cur,up_cur,pc,alp);

tt_rys_resam_detail_dens;

%result_density_level0_avg=mpd;
%result_density_level0_simm=sim_mpd;
%result_density_level0_siml=sim_lpd;
%result_curv_level0_avg=mpc;
%result_curv_level0_simm=sim_mpc;
%result_curv_level0_siml=sim_lpc;

%%%%%%%%%%%%%%%%%%%%% Empirical p-value - general level
%%%%%%%%%%%%%%% density p value
if A>1
dlm1=mean(PR_Array1');
dlm2=mean(PR_Array2');
[pval1,~,~]=pval(dlm1,PR_Array2',dist,2e+3);
[pval2,~,~]=pval(dlm2,PR_Array1',dist,2e+3);
pval1ks=pvalKS(dlm1,PR_Array2);
pval2ks=pvalKS(dlm2,PR_Array1);

pvalm=[pval1',pval2']';
pvalM=mean(pvalm);
pavg=mean(pvalM);

pvalmks=[pval1ks',pval2ks']';
pvalN=mean(pvalmks);

%%%%%%%%%%%%%%%%%%%%% curvature 
cu_m1=mean(CU_Array1,2);
cu_m2=mean(CU_Array2,2);

[pvalc1,~,~]=pval(cu_m1',CU_Array2',dist,2e+3);
[pvalc2,~,~]=pval(cu_m2',CU_Array1',dist,2e+3);

cvalm=[pvalc1',pvalc2']';
cvalM=mean(cvalm);
cavg=mean(cvalM);

cor=correlation_coef(PR_Array1,PR_Array2);

attt_save_dens_plot;

tt_rys_resam_genr_dens;
rys_bootstrap_total;

if exist('rip_PVMR','var')==1
attt_compar_ri_den;
end
else
attt_save_dens_plot_singl;
end
%rys_save_final_2;


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 try
     close(hh1)
     clear('hh1')
 catch
     clear('hh1')
     clc
 end





 clear('ff','xf','dens1','dens2','cr','d1','d2','c0',...
'dato1','dato2','den_av1','den_av2','Nm1','dlm1','dlm2','f','pos1','pos2','rmin1','rmin2','s','k','kt1','kt2','U',...
'scrsz','wait_h','Z1','Z2','i','av_size1','av_size2','E','km1','km2','lm1','lm2','rmax','p1')
 clear('ff','xf','dens1','dens2','cr','d1','d2','c0',...
'dato1','dato2','den_av1','den_av2','Nm1','dlm1','dlm2','f','pos1','pos2','rmin1','rmin2','s','k','kt1','kt2','U',...
'scrsz','wait_h','Z1','Z2','i','av_size1','av_size2','E','km1','km2','lm1','lm2','rmax','p1')
clear('apwc','apwcr','apwd','apwd1','apwg','av_tot','c10','c11','c12','c13','c14','c15','c16')
clear('ci_kc','ci_kcr','ci_kd','ci_kdr','ck','ckk','cr','crM','cu_m1','cu_m2','cur_av1','cur_av2')
clear('cur1','cur2','curm1','curm2','cvalm','cvalM','dato1','dato2','cavg')
clear('eppn','eppp','filtruj','grose','fig','locall','midi1','midi2','mpwd1','mu_1','mu_2')
clear('ppla','plas','pla','pval1','pval1ks','pval2','pval2ks','pvalc1','pvalc2','pvalmks','zz1','zz2')
clear('ripl','slo_kc','slo_kcr','slo_kd','slo_kdr','st_1','st_2','t10','t11','t12','t13','t14','t15','t16')


clear('xx','avg_pm','avg_pmc','cor','crm', 'cur_ks','cur_wilcox','den_ks','den_wilcox','dis','ep','inf','kr',...
'L','lambda_box1','lambda_box2','lo','lo_cur','lo_den','lo_s','mpc','mpd','mpwc','mpwcr','mpwd','mpwg','pa','pavg',...
'pc','pc_low','pc_up','pd','pd_low','pd_up','pkc','pkcr','pks','pks1','pks2','pksw','pkw1','pkw2','pvalm','pvalM','pvalN','PVc','PV',...
'PVM','PVMc','si','sim_lpc','sim_lpd','sim_mpc','sim_mpd','siml','simlcg','simlg','simlk','simlpg','simlv_pc',...
'simlv_pd','simlvg', 'simmcg', 'simmg', 'simmpg',...
'stc_ks', 'stc_wilcox', 'std_ks', 'std_wilcox', 'sup_kc', 'sup_kcr', 'sup_kd', 'sup_kdr',...
'tpwc', 'tpwcr', 'tpwd', 'tpwd1', 'tpwg', 'tt', 'ttk', 'ttt', 'up', 'up_cur', 'up_den', 'up_s', 'warnun')

clear('apwc', 'apwcr', 'apwd', 'apwd1', 'apwg', 'av_tot', 'avg_pm', 'avg_pmc', 'crm', 'crM', 'cur_ks', 'cur_wilcox', 'curm1', 'curm2')
clear('cvalM','den_ks','den_wilcox','dis','dlm1','dlm2','ep','fig','i','lo','lo_cur','lo_den','lo_s','mpc','mpd','mpwc','mpwcr','mpwd',...
    'mpwg','pa','pa','pd','PV','pvalM','','PVc','PVM','PVMc','sim_lpc','sim_lpd','sim_mpc','sim_mpd','simlcg','simlvg','simlg',...
'simlpg','simmcg','simmg','simmpg','tpwc','tpwcr','tpwd','tpwd1','tpwg','up','up_cur','up_den','up_s','warnun')
clear('CI','CIc','CICU','CIM','CIMc','CIPR','dowait','Nmin','options','P','pcm1',...
      'pcm2','pcmm','PP', 'S_size')

