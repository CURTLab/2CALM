scrsz = get(0,'ScreenSize');



dis=dist;
M=S_size;
clear('crm')
crm(1:numel(dis))=alp;
clear('avg_pm','avg_pmc')
avg_pm(1:numel(dist))=mpd;
avg_pmc(1:numel(dist))=mpc;









%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure ('OuterPosition', [scrsz(3)/5.5 scrsz(4)/10 scrsz(4)/0.75 scrsz(4)/1.25]) ;
whitebg('k');

subplot('Position',[0.05, 0.11, 0.42, 0.8])
whitebg('w')
area(dis,crm,'facecolor',[1,0.6,0],'linestyle','-')
hold on
plot(dis,den_ks,'-b','linewidth',1) %%%%%%%%%%KS full vector
hold on
plot(dis,den_wilcox,'-r','linewidth',1) %%%%%%%%%%Wilcoxon full voll vector
plot(dis,pd,':k','linewidth',2)

plot(dis,lo_den,':m','linewidth',1)
plot(dis,up_den,':m','linewidth',1)

text(100,0.9,['{\bf Similarity} \newline Sim_M = ',num2str(sim_mpd),'  \newline Sim_L = ',num2str(sim_lpd),...
    '\newline Avg pvalue = ',num2str(mpd)])
plot(dis,avg_pm,'-k','linewidth',1) %%%%%%%%%% mean pvalue

legend('critical p','Kolmogorow-Smirnov test','Wilcoxon rank sum test','weighted AND of both tests','CI bounds')
xlabel('primary cluster radius in nm')
ylabel('p value')
ylim([0,1])
xlim([0,max(dis)])
title (['First level: Statistic test of primary cluster relative density distribution'])


subplot('Position',[0.51, 0.11, 0.42, 0.8])
whitebg('w')
area(dis,crm,'facecolor',[1,0.6,0],'linestyle','-')
hold on
plot(dis,cur_ks,'-b','linewidth',1) %%%%%%%%%%KS full vector
hold on
plot(dis,cur_wilcox,'r','linewidth',1) %%%%%%%%%%Wilcoxon full voll vector
plot(dis,pc ,':k','linewidth',2)
plot(dis,lo_cur,':k','linewidth',1)
plot(dis,up_cur,':k','linewidth',1)
plot(dis,avg_pmc,'-k','linewidth',1) %%%%%%%%%% mean pvalue
hold on
text(100,0.9,['{\bf Similarity} \newline Sim_M = ',num2str(sim_mpc),'  \newline Sim_L = ',num2str(sim_lpc),...
    '\newline Avg pvalue = ',num2str(mpc)])
legend('critical p','Kolmogorow-Smirnov test','Wilcoxon rank sum test','weighted AND of both tests','CI bounds')
xlabel('primary cluster raius in nm')
ylabel('p value')
ylim([0,1])
xlim([0,max(dis)])
title ('First level: Statistic test of primary cluster curvature distribution')

 
 suptitle(['Primary cluster level: Kolmogorow-Smirnow and Wilcoxon statistic tests for ',num2str(A),' samples with ',num2str(M),' points. \newline',...
           exname1,' and ',exname2])
