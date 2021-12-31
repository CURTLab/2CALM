
if exist('PP','var')== 0
[pa,~,P]=averagepval(PR_Array1,PR_Array2);
PP=mean(P')';
PP=and_term(P(:,1),P(:,2),0.5);    % Cross i2all   Ks P(:,1) and Wilcox P(:,2)
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%% t-norm %%%%%%%%%%%%%%%
%%%%%%%%%%% dens
[tpwd,apwd,mpwd]= and_term(pd,pvalM',0.3);     %%%%%%%% pd-1 level  %%%%%% pvalM-mean2all 
%[tpwd,apwd,mpwd]= and_term(pd,PVM,0.3);       %%%%%%%%%%%%%%% this same 
[tpwd1,apwd1,mpwd1]= and_term(pd,PP,0.5);
[tpwcr,apwcr,mpwcr]= and_term(tpwd,tpwd1,0.7);
%%%%%%%%%%%%%%%% curvat
[tpwc,apwc,mpwc]= and_term(pc,cvalM',0.5);  %%%%%%%%1 level pc %%%%%% mean2all cvalM
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
[tpwg,apwg,mpwg]= and_term(tpwcr,tpwc,1);

cross_pval_new;

