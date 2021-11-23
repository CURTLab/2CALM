
atp_test_data_missing;
A_warnung_small_sample;
if exist('dat2or','var')==0 || exist('dat1or','var')==0
        dat1or=dat1;
        dat2or=dat2;
        N1or=N1;
        N2or=N2;
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%% data reduction %%%%%%%%%%%%%%%%%%
nmin=min(N1,N2);
if nmin>=150
    stop_rapid;
end
plot_reduction;  
A_warnung_small_sample;

tim=min(N1,N2); 
tim=tim*(5/1000)/60;
tim=round(tim,2);

hh=msgbox(['DB-Scan Clustering. It will take a few minutes. (',num2str(tim),' min) Please wait.'],'INFO');
msgboxFontSize(hh,10);
pause(0.5)
clear('ans')
clear('tim')
%%%%%%%%%%%%%%%%%%%%%%%%%% data reduction end %%%%%%%%%%%%%%%%%%%%%%%%%%%

zeit=tic;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

[pos1,Vbox1,lambda_box1,lambda1,avg_min_dist1,inten1,Inten01,IntenSum1,Z1]=D3_data_prep(dat1,xi1,yi1,zi1,ini1,N1);
[pos2,Vbox2,lambda_box2,lambda2,avg_min_dist2,inten2,Inten02,IntenSum2,Z2]=D3_data_prep(dat2,xi2,yi2,zi2,ini2,N2);
clc

alpha=1.5;
betta=5;
posprim1=pos1;
posprim2=pos2;

RRmax=(avg_min_dist1+avg_min_dist2)/2;
RRmax=round(alpha*RRmax);
answer_RRmax_primary_clust; 

R_standard= 2.0*RRmax;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%DBSCAN Clustering%%%%%%%%%%%%%%%%%%%%%%%%

disp('Distance hierarchy.Please wait')
kt1rys = cluster(Z1,'cutoff',R_standard,'criterion','distance');
kt2rys = cluster(Z2,'cutoff',R_standard,'criterion','distance');
[~,dens1standard,~,intcl1standard,c1standard,larg1standard]=feature_singl_neu_cl(kt1rys,pos1,inten1,0);
[~,dens2standard,~,intcl2standard,c2standard,larg2standard]=feature_singl_neu_cl(kt2rys,pos2,inten2,0);


larg1standard(:,3)=dens1standard/lambda1;
larg1standard(:,4)=intcl1standard/IntenSum1;
larg2standard(:,3)=dens2standard/lambda2;
larg2standard(:,4)=intcl2standard/IntenSum2;

larg1standard(:,5:7)=c1standard;
larg2standard(:,5:7)=c2standard;

clear('dens1standard', 'dens2standard' ,'intcl1standard' ,'intcl2standard')
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


clc
disp('DB-Scan. Please wait')

[cl1,c_primar1]=DBSCAN_neu(pos1,RRmax,alpha,5,4,N1);
[cl2,c_primar2]=DBSCAN_neu(pos2,RRmax,alpha,5,4,N2); 
try
if isempty(c_primar1)==1 || isempty(c_primar2)==1
stopp
end
catch
close all
msgbox('For this radius, one of the samples has no primary clusters. Increase the radius')
try
close(hhc);
clear('hhc')
catch
clear('hhc')   
end
A_start; 
end
    

c_pri1=subcentroid(cl1,pos1,c_primar1) ; 
c_pri2=subcentroid(cl2,pos2,c_primar2) ; 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% DB Scan second %%%%%%%%%%%%%%%%%
disp('Subcentroids extraction')

[cl11,~]=DBSCAN_neu(pos1,RRmax,alpha,3,20,N1);
[cl22,~]=DBSCAN_neu(pos2,RRmax,alpha,3,20,N2);  

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%Hierarchical clustering%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%% ward linkage correction %%%%%%%%%%







%%%%%%%%%%%%%%%%%%%%%% ANALYSE %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

disp('PDF calculation')

[~,densp1,curp1,intenp1,~,largp1]=feature_singl_neu_cl(cl1,pos1,inten1,0);
largp1(:,3)=densp1/lambda1;
largp1(:,4)=intenp1/IntenSum1;

[~,densp2,curp2,intenp2,~,largp2]=feature_singl_neu_cl(cl2,pos2,inten2,0);
largp2(:,3)=densp2/lambda2;
largp2(:,4)=intenp2/IntenSum2;

[~,bdensp1,bcurp1,~,~,~]=feature_singl_neu_cl(cl1,pos1,inten1,1);
[~,bdensp2,bcurp2,~,~,~]=feature_singl_neu_cl(cl2,pos2,inten2,1);

largp1 =sortrows(largp1,1,'descend');
largp2 =sortrows(largp2,1,'descend');

try
close(hhc);
clear('hhc')
catch
 clear('hhc')   
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%% comparison  density %%%%%%%%%%%%%%%%%%%%%%%%
[~,pprim,~]=kstest2(densp1/lambda1,densp2/lambda2);
wprim=ranksum(densp1/lambda1,densp2/lambda2);

[~,bpprim,~]=kstest2(bdensp1/lambda_box1,bdensp2/lambda_box2);
bwprim=ranksum(bdensp1/lambda_box1,bdensp2/lambda_box2);

[pprim_glob,~,~] = and_term(pprim,bpprim,0.6);
[wprim_glob,~,~] = and_term(wprim,bwprim,0.6);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%% comparison  curvature
[~,cprim,~]=kstest2(curp1,curp2);
wcprim=ranksum(curp1,curp2);
[~,bcprim,~]=kstest2(bcurp1,bcurp2);
bwcprim=ranksum(bcurp1,bcurp2);
[cprim_glob,~,~] = and_term(cprim,bcprim,0.5);
[wcprim_glob,~,~] = and_term(wcprim,bwcprim,0.5);


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% plots  pdf %%%%%%%%%%%%%%%%%%%%%%%%


[~,~,xpdf1,ypdf1,~]=testpdf(densp1/lambda1,0);
[~,~,xpdf2,ypdf2,~]=testpdf(densp2/lambda2,0);
[~,~,xpdf1c,ypdf1c,~]=testpdf(curp1,0);
[~,~,xpdf2c,ypdf2c,~]=testpdf(curp2,0);
nametyp='primary';
a1=pprim_glob;
a2=wprim_glob;
a3=cprim_glob;
a4=wcprim_glob;
tt_rys_statistic_primat
clear('xpdf2','xpdf2c','xpdf1','xpdf1c','ypdf2','ypdf2c','ypdf1','ypdf1c','nametyp','a1','a2','a3','a4')


try
close(hhc);
clear('hhc')
catch
 clear('hhc')   
end
try
close(hhp);
clear('hhp')
catch
 clear('hhp')   
end



plot_prim_both;
pause(0.1)
plot2D_primary_both;

hhba=msgbox('Reduced data stored in dat1/2 replaces original data. If you want to return to the original samples use the menu option DATA STATUS and RESTORE','INFO','help');
clear('hhba')
pause(0.1)
pos1=posprim1;
pos2=posprim2;


elapsed=toc(zeit)





clear('en','A1','A2','B1','B2','alpha','betta','button','cf','d1','d2','gama','hip','i','L','N','NC1','NC2','nd1','nd2')
clear('pk','S','scrsz','stat',...
 'xcl','xh','xpdf1','xpdf1a','xpdf2','xpdf2a','ycl','yh','ypdf1','ypdf1a','ypdf2','ypdf2a',...
 'zcl','zam','zaM')

clear('cp1','cp2','den_pr_1','den_pr_1r','den_pr_2','den_pr_2r','dens1r','dens2r','dens1','dens2')
clear('ecc_pr_1','eccr1','ecc_pr_2','eccr2','ecc1','ecc2','f','intcl1','intcl1r','intcl2','intcl2r',...
  'intcl_pr_1','intcl_pr_1r','intcl_pr_2','intcl_pr_2r','nz1','nz1r','nz2','nz2r')



clear('nz_pr_1','nz_pr_1r','nz_pr_2','nz_pr_2r','kt1','kt2')
clear('ABSTAN1','ABSTAN2','dodatek')


clear('a1', 'a2', 'a3', 'a4', 'avg_min_dist1', 'avg_min_dist2', 'bcp1', 'bcp2', 'bcprim',...
 'bcurp1',  'dodatek','bcurp2', 'bdensp1', 'bdensp2', 'bintclp1', 'bintclp2', 'bnzp1', 'bnzp2','bpprim','bwprim', 'bwcprim') 
clear('bwprimc_pri1',...
'cprim', 'cprim_glob', 'curp1', 'curp2')
clear('densp1', 'densp2', 'en', 'intclp1', 'intclp2', 'inten1', 'inten2', 'IntenSum1', 'IntenSum2','intenp1','intenp2')


clear('pos1','pos2', 'nzp1', 'nzp2',  'nametyp', 'pprim', 'pprim_glob','Nmaxor')

clear('wcprim', 'wcprim_glob', 'wprim', 'wprim_glob', 'xpdf1c', 'xpdf2c', 'ypdf1c', 'ypdf2c',...
'Z1', 'Z2', 'zm')