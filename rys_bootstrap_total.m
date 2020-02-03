
if exist('PP','var')== 0
[pa,~,P]=averagepval(PR_Array1,PR_Array2);
PP=mean(P')';
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%% t-norm %%%%%%%%%%%%%%%
%%%%%%%%%%% dens
[tpwd,apwd,mpwd]= and_term(pd,pvalM',0.80);%%%%%%%%%%%%%%
[tpwd1,apwd1,mpwd1]= and_term(pd,PP,0.5);
[tpwcr,apwcr,mpwcr]= and_term(tpwd,tpwd1,0.5);
%%%%%%%%%%%%%%%% curvat
[tpwc,apwc,mpwc]= and_term(pc,cvalM',0.5);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
[tpwg,apwg,mpwg]= and_term(tpwcr,tpwc,0.5);
cross_pval_new;




%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clear('crM','crm','av_tot')
crM(1:numel(dist))=alp;
crm(1:numel(dist))=alp;
av_tot(1:numel(dist))=mpwg;        %; avg_total%

if mpwg>alp
    si=1;
else
    si=-1;
end

if TEST_R(3)*si>0
warnun=0;
else
warnun=1;
end


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

scrsz = get(0,'ScreenSize');
figure ('OuterPosition', [scrsz(3)/5.5 scrsz(4)/4 scrsz(4)/0.8 scrsz(4)/1.55]) ;
whitebg('w');


 area(dist,crm,'facecolor',[1,0.6,0],'linestyle','-')
 hold on
 %area(dist,crm,'facecolor','r','linestyle','none')
 hold on
 %plot(dist,tpv,':b','Linewidth',1.00)
 plot(dist,up,':k','Linewidth',1.0)
 grid on
 hold on
 plot(dist,tpwg,'-b','Linewidth',1.50) 
 plot(dist,lo,':k','Linewidth',1.00)
 
 plot(dist,av_tot,'-k','linewidth',1.5)
 %plot(dist,crlo,'--k','linewidth',1.5)
 %plot(dist,crm,'-r')
 text(100,0.8,['{\bf Similarity} \newline ',sim_class(simlg), '\newline Sim_M = ',num2str(simmg),'  \newline Sim_L = ',num2str(simlg),...
    '\newline Avg pvalue = ',num2str(mpwg)])
 legend('critical p','upper-CI','AND of tests','lower-CI','av-p-value')
 xlim([min(dist),max(dist)])
 ylim([0,1])
 xlabel('cluster size in nm')
 ylabel('total p-value')
 title(['Second level: Aggregated pvalue =  ',num2str(mpwg),'   Aggregated similarity sim_L= ',num2str(simlg) ])
 
 
 suptitle(['Aggregated similarity statistic for ',num2str(A),' samples with ',num2str(M),' points \newline',exname1,' and ',exname2])
 
%result_aggreg_avg=mpwg;
%result_aggreg_simm=simmg;
%result_aggreg_siml=simlg;
 