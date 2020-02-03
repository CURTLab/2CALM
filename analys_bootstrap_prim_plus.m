clc
close all
pause(0.01)
locall=1;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%% data test %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

if exist('dat1', 'var')==0  || exist('dat2', 'var')==0
    a_info_load;
    A_start;
else
    if isempty(dat1)==1 || isempty(dat2)==1
        a_info_load;
        A_start;
    end
end

mu_1=0;
st_1=0;
mu_2=0;
st_2=0;

A_warnung_small_sample;



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
rng('default');
if exist('TEST_R', 'var')==0
TEST_R=[0.0,0.0,0,0.05,0.05,250,150];
end
try
close(hhh)    
clear('hhh')
catch
clear('hhh')
end

NM = max(N1,N2);
Nm = min(N1,N2);
Nmin=Nm;

answer1;

if Nm <= 200
      A_warnung_small_sample; %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif Nm <= 1000
      M=round(0.8*Nm);
elseif Nm <= 3000
      M=min(S_size,Nm);
elseif Nm > 3000 && Nm < 100000
      M=min(S_size,Nm);
else
      M=S_size;
end
%%%%%%%%%%%%%%%%%%%%%%%%factor for min dist calculation%%%%%%%%%%%%%%%%

if M<20000
    grose=0;
    disp('density calculation-bullet sum')
    else
    grose=1;
    disp('density calculation-mixed')
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

dato1 = data_reduction(dat1,M,N1);
dato2 = data_reduction(dat2,M,N2);
pos1tem=[dato1(:,xi1),dato1(:,yi1),dato1(:,zi1)];
pos2tem=[dato2(:,xi2),dato2(:,yi2),dato2(:,zi2)];



%%%%%%%%%%%%%%%%%%%%%%%%%%%% max radius of clusters %%%%%%%%%%%%%%%%%%%%%%%%

rtest1=radius_test(pos1tem);
rtest2=radius_test(pos2tem);
rtest=min(rtest1,rtest2);

clear('dist')
if locall ==1
    rmax=round(rtest*0.50);
else
    rmax=Rmax;
end

if rmax < 1000
    rmax=1000;
end

dist=10:10:rmax;
U=numel(dist);
clear('rtest1', 'rtest2' ,'rtest' ,'dato1', 'dato2', 'pos1tem', 'pos2tem', 'Nm', 'NM')

antwort_time_prim;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%start%%%%%%%%%%%%
     

clear('KDPRIM_Array', 'KCPRIM_Array', 'KDRPRIM_Array', 'KCRPRIM_Array')


KDPRIM_Array(1:U,1:A)=0; % pval KS density
KDRPRIM_Array(1:U,1:A)=0; %pval WX density
KCPRIM_Array(1:U,1:A)=0;  %pval KS curvature
KCRPRIM_Array(1:U,1:A)=0; %pval WX curvature


dowait=1;
if dowait==1
wait_h = waitbar(0, 'Resampling and density features calculation...');
end

for k=1:A
   
   display(['sample  ',num2str(k),'/',num2str(A)])
   tic
   clear('dato1','dato2')
   dato1 = data_reduction(dat1,M,N1);
   dato2 = data_reduction(dat2,M,N2);
   clear('pos1' ,'pos2')
   
   pos1=[dato1(:,xi1),dato1(:,yi1),dato1(:,zi1)]; 
   pos2=[dato2(:,xi2),dato2(:,yi2),dato2(:,zi2)];
   inten2=dato2(:,ini2);
   inten1=dato1(:,ini1);
  lambda_box1=M/((max(pos1(:,1))-min(pos1(:,1)))*(max(pos1(:,2))-min(pos1(:,2)))*(max(pos1(:,3))-min(pos1(:,3)))); 
  lambda_box2=M/((max(pos2(:,1))-min(pos2(:,1)))*(max(pos2(:,2))-min(pos2(:,2)))*(max(pos2(:,3))-min(pos2(:,3))));  
    
 
alpha=1.0;
betta=5;
%posprim1=pos1;
%posprim2=pos2;
 
   for i=1:U
      
  
    
     [clbootprim1,cboot_primar1]=DBSCAN_neu(pos1,dist(i),alpha,4,3,M);
     [clbootprim2,cboot_primar2]=DBSCAN_neu(pos2,dist(i),alpha,4,3,M);
  
     [~,densboot1,curpboot1,~,~,~]=feature_singl_neu_cl(clbootprim1,pos1,inten1,0);
     [~,densboot2,curpboot2,~,~,~]=feature_singl_neu_cl(clbootprim2,pos2,inten2,0);
     
     if isempty(densboot1)==0 && isempty(densboot2)==0
         if size(cboot_primar1,1)>1 && size(cboot_primar2,1)>1
              [~,pks1,~]=kstest2(densboot1/lambda_box1,densboot2/lambda_box2);
              [~,pks2,~]=kstest2(densboot1/sum(densboot1),densboot2/sum(densboot2));
              pks=(pks1+pks2)/2;
              
              pkw1=ranksum(densboot1/lambda_box1,densboot2/lambda_box2);
              pkw2=ranksum(densboot1/sum(densboot1),densboot2/sum(densboot2));
              pksw=(pkw1+pkw2)/2;
         else
              pks=0;
              pksw=0;
         end
     else
              pks=0;
              pksw=0;
     end
     
      
  
    
      if isempty(curpboot1)==0 && isempty(curpboot2)==0  
       if size(cboot_primar1,1)>1 && size(cboot_primar2,1)>1    
         [~,pkc,~]=kstest2(curpboot1,curpboot2);
          pkcr=ranksum(curpboot1,curpboot2); 
       else
        pkc=0;
        pkcr=0;
       end
       else
        pkc=0;
        pkcr=0;
      end
         
 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% test p-val
         
         
         
     if isnan(pks)==1
         pks=0;
     end
     
     if isnan(pkc)==1
         pkc=1;
     end
     if isnan(pksw)==1
         pksw=0;
     end
     if isnan(pkcr)==1
         pkcr=1;
     end
 %%%%%%%%%%%%%%%% detail level   
    KCPRIM_Array(i,k)=pkc;
    KDPRIM_Array(i,k)=pks; 
    KCRPRIM_Array(i,k)=pkcr;
    KDRPRIM_Array(i,k)=pksw;
 
  %%%%%%%%%%%%%%%%% general level
  
   
    
  if dowait==1
        try
             waitbar(((k-1)*U+i)/(A*U),wait_h);
        catch
             helpdlg('Calculations had been aborted','Waitbar message')
             clear('KDPRIM_Array', 'KDRPRIM_Array')
             clear('KCPRIM_Array', 'KCRPRIM_Array')
             clear('wait_h');
             dowait=0;
            return;
        end
  end
    
   end
   
 toc
end
if dowait==1
 close(wait_h)
 clear('wait_h')
end


answer_alpha;


%%%%%%%%%%%%%%%%%%%%%%%% begin analyse detail level
den_ks=mean(KDPRIM_Array,2);
den_wilcox=mean(KDRPRIM_Array,2);
cur_wilcox=mean(KCRPRIM_Array,2);
cur_ks=mean(KCPRIM_Array,2);

std_ks=std(KDPRIM_Array')';
std_wilcox=std(KDRPRIM_Array')';
stc_wilcox=std(KCRPRIM_Array')';
stc_ks=std(KCPRIM_Array')';


[ci_kd,~]=CI_calcul_rapid(KDPRIM_Array,alp,1);
[ci_kdr,~]=CI_calcul_rapid(KDRPRIM_Array,alp,1);
[ci_kc,~]=CI_calcul_rapid(KCPRIM_Array,alp,1);
[ci_kcr,~]=CI_calcul_rapid(KCRPRIM_Array,alp,1);

slo_kd=ci_kd(:,4);
sup_kd=ci_kd(:,5);
slo_kdr=ci_kdr(:,4);
sup_kdr=ci_kdr(:,5);
slo_kc=ci_kc(:,4);
sup_kc=ci_kc(:,5);
slo_kcr=ci_kcr(:,4);
sup_kcr=ci_kcr(:,5);

%%%%%%%%%% KS und Wilcoxon only 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% weight mean od ka  and wilcoxon
[pd,~,mpd] =  and_term(den_ks,den_wilcox,0.75);
[pd_low,~,~] =and_term(slo_kd,slo_kdr,0.75);
[pd_up,~,~] = and_term(sup_kd,sup_kdr,0.75);

[pc,~,mpc] =   and_term(cur_ks,cur_wilcox,0.75);
[pc_low,~,~] = and_term(slo_kc,slo_kcr,0.75);
[pc_up,~,~] =  and_term(sup_kc,sup_kcr,0.75);

lo_den=max(0,pd-pd_low);
up_den=max(0,pd+pd_up);
lo_cur=max(0,pc-pc_low);
up_cur=max(0,pc+pc_up);

sim_mpd=a_similarity_M(mpd,alp);
sim_mpc=a_similarity_M(mpc,alp);
[sim_lpd,simlv_pd] = a_similarity_L(lo_den,up_den,pd,alp);
[sim_lpc,simlv_pc] = a_similarity_L(lo_cur,up_cur,pc,alp);
atp_save_dens_plot;
tt_rys_resam_detail_dens_prim;




%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clear('alpha','avg_pm','avg_pmc','betta','cboot_primar1','cboot_primar2','ci_kc','ci_kcr','ci_kd','ci_kdr',...
'clbootprim1','clbootprim2','crm','cur_ks','cur_wilcox','curpboot1','curpboot2','dato1','dato2','den_ks',...
'den_wilcox','densboot1','densboot2','dis','dowait','grose','i','inten1','inten2','k','lambda_box1',...
'lambda_box2','lo_cur','lo_den','locall','mpc','mpd','mu_1','mu_2','Nmin','pc','pc_low','pc_up',...
'pd','pd_low','pd_up','pkc','pkcr','pks','pks1','pks2','pksw','pkw1','pkw2',...
'pos1','pos2','rmax','S_size','scrsz','slo_kc','slo_kcr','slo_kd','slo_kdr',...
'sim_lpc','sim_lpd','sim_mpc','sim_mpd',...
'simlv_pc','simlv_pd','st_1','st_2','stc_ks','stc_wilcox','std_ks','std_wilcox','sup_kc',...
'sup_kcr','sup_kd','sup_kdr','U','up_cur','up_den')
