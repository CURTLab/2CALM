






clear('crm','av_tot')
crm(1:numel(dist))=alp;
av_tot(1:numel(dist))=mpw; %avg_total;

scrsz = get(0,'ScreenSize');
figure ('OuterPosition', [scrsz(3)/5 scrsz(4)/10 scrsz(4)/0.8 scrsz(4)/1.25]) ;
whitebg('w');

 hold on
 area(dist,crm,'facecolor',[1,0.6,0],'linestyle','-')
 hold on
 plot(dist,tpw,'-b','Linewidth',1.50) 
 plot(dist,lok,':k','Linewidth',1.0) 
 plot(dist,upk,':k','Linewidth',1.0)
 grid on
 hold on
 %plot(dist,crM,'-r')
 %plot(dist,crm,'-r')
 
 plot(dist,av_tot,'-k','linewidth',1.5)
 

 legend('critical p','p-tnorm','CI low','CI up','Average p')
 text(100,0.8,['{\bf Similarity} \newline ',sim_class(simriplK), '\newline Sim_M = ',num2str( simripK),'  \newline Sim_L = ',num2str(simriplK),...
    '\newline Avg pvalue = ',num2str(mpw)])
 xlim([min(dist),max(dist)])
 ylim([0,1])
 xlabel('cluster max size in nm')
 ylabel('p-value')
 
 title(['Second level: Aggregated pvalue = ',num2str(mpw),' Similarity_L = ',num2str(simriplK)])
 suptitle(['Ripley-K similarity statistic for ',num2str(A),' samples with ',num2str(M),' points \newline',...
     exname1,' and ',exname2])
 
 
result_Ri_aggreg_avg=mpw;
result_Ri_aggreg_simm=simripK;
result_Ri_aggreg_siml=simriplK;
 
 

 clear('ff','xf','K1','K2','L11','L12','box_ripl1','box_ripl2',...
'dato1','dato2','h','i','Nm1','p','pos1','pos2','rmin1','rmin2','s',...
'scrsz','wait_h','c0','cr','d1','d2','E','km1','km2','rmax')

clear('av_tot','avg_pm', 'avg_pmc','CI','CIMR', 'CIMRc', 'CIripK' ,'crm', 'dis', 'lm1', 'lm2', 'Nmin',...
'options', 'PP', 'PVMR' ,'PVMRc', 'PVR', 'PVRc',...
'siml_r', 'simlc_r', 'simm_r', 'simmc_r' ,'zero')

