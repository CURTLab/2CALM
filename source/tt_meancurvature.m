
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%    average densty 

if exist('CU_Array1','var')==1
    mcu1=mean(CU_Array1,2);
    mcu2=mean(CU_Array2,2);
 [~, p_v_meancurv,~]=kstest2(mcu1,mcu2);

dis=dist;

scrsz = get(0,'ScreenSize');
figure ('OuterPosition', [scrsz(3)/5.5 scrsz(4)/10 scrsz(4)/0.75 scrsz(4)/1.25]) ;

subplot('Position',[0.05, 0.11, 0.42, 0.8])
whitebg('w');
grid on
hold on
plot(dist,mcu1,'-b','linewidth', 2)
hold on
plot(dist,mcu2,'-r','linewidth', 2)
legend('Sample 1','Sample 2')
xlabel('cluster max dimension in nm')
ylabel(' average of the curvature of clusters')
%ylim([0,1])
xlim([0,max(dist)])
title (['Average of curvature of clusters. KS-test =',num2str(p_v_meancurv),'\newline S1:'  ,exname1,'  S2:',exname2])

end

subplot('Position',[0.51, 0.11, 0.42, 0.8])
whitebg('w')
area(dis,crm,'facecolor',[1,0.6,0],'linestyle','-')
hold on
plot(dis,cur_ks,'-b','linewidth',1) %%%%%%%%%%KS full vector

hold on
plot(dis,cur_wilcox,'r','linewidth',1) %%%%%%%%%%Wilcoxon full voll vector
%plot(dis,pc ,':k','linewidth',2)
%plot(dis,lo_cur,':k','linewidth',1)
%plot(dis,up_cur,':k','linewidth',1)
plot(dis,avg_pmc,'-k','linewidth',1) %%%%%%%%%% mean pvalue

text(50,0.9,['\newline Avg pvalue KS-test= ',num2str(mpc)])
legend('critical p','Kolmogorow-Smirnov test','Wilcoxon rank sum test','Average p value')
xlabel('cluster size in nm')
ylabel('p value')
xlim([0,max(dis)])
ylim([0,1])
title ('First level: Statistic test of cluster curvature distribution')



















  clear('mcu1','mcu2','mnz1','mnz2','scrsz') 
    
    
    
    