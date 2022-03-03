
scrsz = get(0,'ScreenSize');
alp=0.05;
dis=dist;
S_size=bot_S_size;
M=S_size;
A=bot_M;
PVMR = rip_PVMR;
simm_r=rip_simm_r;
siml_r=rip_siml_r;


clear('crm')
crm(1:numel(dis))=alp;
clear('avg_pm','avg_pmc')
avg_pm(1:numel(dist))=mpd;
avg_pmc(1:numel(dist))=mpc;



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure ('OuterPosition', [scrsz(3)/5.5 scrsz(4)/10 scrsz(4)/0.75 scrsz(4)/1.25]) ;
whitebg('w')
area(dis,crm,'facecolor',[1,0.6,0],'linestyle','-')
hold on
plot(dis,den_ks,'-k','linewidth',2) %%%%%%%%%%  KS full vector
hold on
%plot(dis,den_wilcox,'-r','linewidth',1) %%%%%%%%%%Wilcoxon full voll vector
%plot(dis,pd,':k','linewidth',2)
%plot(dis,lo_den,':m','linewidth',1)
%plot(dis,up_den,':m','linewidth',1)

plot(dis,PVMR,'-b','linewidth',2) %%%%%%%%%% full cross ripley
grid on

text(100,0.9,['{\bf Similarity Density} \newline Sim_M = ',num2str(sim_mpd),'  \newline Sim_L = ',num2str(sim_lpd),...
    '\newline Avg pvalue = ',num2str(mpd)])

text(100,0.6,['{\bf Similarity Ripley} \newline Sim_M = ',num2str(simm_r),'  \newline Sim_L = ',num2str(siml_r), '\newline Avg pvalue = ',num2str(mean(PVMR))],'color','b')

%plot(dis,avg_pm,'-k','linewidth',1) %%%%%%%%%% mean pvalue

legend('critical p','density p-value','K-Ripley p-value')
xlabel('cluster size in nm')
ylabel('p value')
ylim([0,1])
xlim([min(dis),max(dis)])
title (['Comparison: cluster relative density distribution vs. Ripley K-function'])
suptitle(['Comparison: Kolmogorow-Smirnow and K-Ripley statistic test for ',num2str(A),' samples with ',num2str(M),' points. \newline',...
           exname1,' and ',exname2])
       
clear ('dis' , 'S_size','A','PVMR','simm_r','siml_r')
clear('crm')
clear('avg_pm','avg_pmc')