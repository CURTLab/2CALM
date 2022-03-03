
clear('cr')
cr(1:numel(dist))=alp;

 scrsz = get(0,'ScreenSize');
 figure ('OuterPosition', [scrsz(3)/5 scrsz(4)/10 scrsz(4)/0.8 scrsz(4)/1.25]) ;
 area(dist,cr,'facecolor',[1,0.6,0],'linestyle','-')
 hold on
 plot(dist,tpw,'-k','linewidth',1.5)
 hold on
 plot(dist,pvalM,'-b','Linewidth',0.5) 
 grid on
 hold on
 %plot(dist,pval2,':m','Linewidth',1)
 hold on
 plot(dist,lok,':k','Linewidth',1)
 plot(dist,upk,':k','Linewidth',1)
% plot(dist,cr,'-r')
 text(100,0.9,['{\bf Similarity} \newline Sim_M = ',num2str( simripK),'  \newline Sim_L = ',num2str(simriplK),...
    '\newline Avg pvalue = ',num2str(mpw)])

 ylim([0,1])
 xlim([min(dist),max(dist)])
 legend('significant level','cumulative p KS','average-cross KS','CI low','CI-up')
 xlabel('cluster max size in nm')
 ylabel('p-value')
 title(['Second level: Empirical pvalue: Avg. of Ripley-K_1 vs. all Ripley-K_2 (cross and dist2dist). Avg. pval: ',num2str(mpw)])
 suptitle(['Ripley statistic for ',num2str(A),' samples with ',num2str(M),' points \newline',...
     exname1,' and ',exname2])
 
 
 
clear('av_tot','avg_pm', 'avg_pmc','CI','CIMR', 'CIMRc', 'CIripK' ,'crm', 'dis', 'lm1', 'lm2', 'Nmin',...
'options', 'PP', 'PVMR' ,'PVMRc', 'PVR', 'PVRc',...
'siml_r', 'simlc_r', 'simm_r', 'simmc_r' ,'zero')
