scrsz = get(0,'ScreenSize');
dis=dist;
M=S_size;
answer_cross;
tic
[PVR,CI,PVMR,CIMR,simm_r,siml_r]=a_cross_comparison(K_Array1,K_Array2,10,dist,alp);
[PVRc,CI,PVMRc,CIMRc,simmc_r,simlc_r]=a_cross_comparison(L1_Array1,L1_Array2,10,dist,alp);
rip_PVMR=PVMR;  
rip_simm_r=simm_r;
rip_siml_r=siml_r;

toc
clear('avg_pm','avg_pmc')
avg_pm(1:numel(dist))=mean(PVMR);
avg_pmc(1:numel(dist))=mean(PVMRc);

%result_ripleyK_level1_avg=mean(PVMR);
%result_ripleyK_level1_simm=simm_r;
%result_ripleyK_level1_siml=siml_r;
%result_ripleyL_level1_avg=mean(PVMRc);
%result_ripleyL_level1_simm=simmc_r;
%result_ripleyL_level1_siml=simlc_r;



clear('crm')
crm(1:numel(dis))=alp;

figure ('OuterPosition', [scrsz(3)/5 scrsz(4)/10 scrsz(4)/0.75 scrsz(4)/1.25]) ;
whitebg('w');

subplot('Position',[0.05, 0.11, 0.42, 0.8])
whitebg('w')
area(dis,crm,'facecolor',[1,0.6,0],'linestyle','-')
hold on
grid on

plot(dis,PVMR,'-b','linewidth',1) %%%%%%%%%% mean cross
hold on
plot(dis,PVR,'-r','linewidth',1) %%%%%%%%%% full cross
plot(dis,CIMR(:,1),':b','linewidth',1) %%%%%%%%%% lo CI vector
plot(dis,CIMR(:,2),':b','linewidth',1) %%%%%%%%%% up CI vector
plot(dis,avg_pm,'-k','linewidth',1) %%%%%%%%%% mean pvalue

text(100,0.9,['{\bf Similarity} \newline Sim_M = ',num2str(simm_r),'  \newline Sim_L = ',num2str(siml_r), '\newline Avg pvalue = ',num2str(mean(PVMR))])
legend('critical p','average-cross comparison','cross comparison','LO CI bounds','UP CI bounds','mean p-value')
xlabel('cluster max size in nm')
ylabel('p value')
ylim([0,1])
xlim([min(dis),max(dis)])
title (['Second level: Nonparametric test of K-Ripley function'])

%subplot(1,2,2)
subplot('Position',[0.51, 0.11, 0.42, 0.8])
whitebg('w')
area(dis,crm,'facecolor',[1,0.6,0],'linestyle','-')
hold on
grid on
plot(dis,PVMRc,'-b','linewidth',1) %%%%%%%%%%KS full vector
hold on
plot(dis,PVRc,'r','linewidth',1) %%%%%%%%%%Wilcoxon full voll vector
plot(dis,CIMRc(:,1),':b','linewidth',1) %%%%%%%%%% lo CI vector
plot(dis,CIMRc(:,2),':b','linewidth',1) %%%%%%%%%% up CI vector
plot(dis,avg_pmc,'-k','linewidth',1)
text(100,0.9,['{\bf Similarity} \newline Sim_M = ',num2str(simmc_r),'  \newline Sim_L = ',num2str(simlc_r), '\newline Avg pvalue = ',num2str(mean(PVMRc))])

legend('critical p','average-cross comparison','cross comparison','LO CI bounds','UP CI bounds','mean p-value')
xlabel('cluster max size in nm')
ylabel('p value')
xlim([min(dis),max(dis)])
ylim([0,1])
title (['Second level: Nonparametric test of of H-Ripley function'])





suptitle(['General level: Empirical statistic test for ',num2str(A),' samples with ',num2str(M),' points (K - and H-Ripley function) \newline',...
           exname1,' and ',exname2])
       
 try
     close(hh1)
     clear('ans','hh1')
 catch
     clc
     clear('ans','hh1')
 end

      
       
       
clear('av_tot','avg_pm', 'avg_pmc','CI','CIMR', 'CIMRc', 'CIripK' ,'crm', 'dis', 'lm1', 'lm2', 'Nmin',...
'options', 'PP', 'PVMR' ,'PVMRc', 'PVR', 'PVRc',...
'siml_r', 'simlc_r', 'simm_r', 'simmc_r' ,'zero')

