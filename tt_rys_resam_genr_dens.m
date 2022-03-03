scrsz = get(0,'ScreenSize');
answer_cross;
dis=dist;
M=S_size;
[PV,CI,PVM,CIM,simmpg,simlpg]=a_cross_comparison(PR_Array1,PR_Array2,10,dist,alp);
[PVc,CIc,PVMc,CIMc,simmcg,simlcg]=a_cross_comparison(CU_Array1,CU_Array2,10,dist,alp);
%result_density_level1_avg=mean(PVM);
%result_density_level1_simm=simmpg;
%result_density_level1_siml=simlpg;
%result_curv_level1_avg=mean(PVMc);
%result_curv_level1_simm=simmcg;
%result_curv_level1_siml=simlcg;

clear('avg_pm','avg_pmc')
avg_pm(1:numel(dist))=mean(PVM);
avg_pmc(1:numel(dist))=mean(PVMc);
clear('crm')
crm(1:numel(dis))=alp;

figure ('OuterPosition', [scrsz(3)/5.5 scrsz(4)/10 scrsz(4)/0.75 scrsz(4)/1.25]) ;
whitebg('k');

subplot('Position',[0.05, 0.11, 0.42, 0.8])
whitebg('w')
area(dis,crm,'facecolor',[1,0.6,0],'linestyle','-')
hold on
grid on

plot(dis,PVM,'-b','linewidth',1) %%%%%%%%%% mean cross
hold on
%plot(dis,PV,'-r','linewidth',1) %%%%%%%%%% full cross
plot(dis,CIM(:,1),':b','linewidth',1) %%%%%%%%%% lo CI vector
plot(dis,CIM(:,2),':b','linewidth',1) %%%%%%%%%% up CI vector
plot(dis,avg_pm,'-k','linewidth',1) %%%%%%%%%% mean pvalue

text(100,0.9,['{\bf Similarity} \newline Sim_M = ',num2str(simmpg),'  \newline Sim_L = ',num2str(simlpg), '\newline Avg pvalue = ',num2str(mean(PVM))])
%legend('critical p','mean-cross comparison','cross comparison','LO CI bounds','UP CI bounds','mean p-value')
legend('critical p','mean-cross comparison','LO CI bounds','UP CI bounds','mean p-value')

xlabel('cluster max size in nm')
ylabel('p value')
ylim([0,1])
xlim([0,max(dis)])
title (['Second level: test of means of cluster relative density distribution'])

%subplot(1,2,2)
subplot('Position',[0.51, 0.11, 0.42, 0.8])
whitebg('w')
area(dis,crm,'facecolor',[1,0.6,0],'linestyle','-')
hold on
grid on
plot(dis,PVMc,'-b','linewidth',1) %%%%%%%%%%KS full vector
hold on
%plot(dis,PVc,'r','linewidth',1) %%%%%%%%%%Wilcoxon full voll vector
plot(dis,CIMc(:,1),':b','linewidth',1) %%%%%%%%%% lo CI vector
plot(dis,CIMc(:,2),':b','linewidth',1) %%%%%%%%%% up CI vector
plot(dis,avg_pmc,'-k','linewidth',1)
text(100,0.9,['{\bf Similarity} \newline Sim_M = ',num2str(simmcg),'  \newline Sim_L = ',num2str(simlcg), '\newline Avg pvalue = ',num2str(mean(PVMc))])
legend('critical p','mean-cross comparison','LO CI bounds','UP CI bounds','mean p-value')
%legend('critical p','mean-cross comparison','cross comparison','LO CI bounds','UP CI bounds','mean p-value')
xlabel('cluster max size in nm')
ylabel('p value')
xlim([0,max(dis)])
ylim([0,1])
title (['Second level: test of means of cluster curvature distribution'])
suptitle(['General level: Empirical statistic test for ',num2str(A),' samples with ',num2str(M),' points (Cluster density and curvature). \newline',...
           exname1,' and ',exname2])

try
     close(hh1)
     clear('hh1')
 catch
     clear('hh1')
     clc
 end       
    
clear('hh')