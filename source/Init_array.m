



clear('all_ks_dens','all_wilcox_dens','all_ave_dens1',...
'all_ave_dens2','all_ave_dens_ks','all_ks_curv',...
'all_wilcox_curv','all_ave_curv1','all_ave_curv2',...
'all_ave_curv_ks','all_ks_ripl','all_ks_conc','all_start_delta')

col_nr= NumSamp_A* NumSamp_B;
row_nr= numel(dist);  

%%%%%%%%%%%%%%%%%%% density %%%%%%%%%%%%%%%%%
all_ks_dens(1:row_nr,1:col_nr)=0;
all_wilcox_dens(1:row_nr,1:col_nr)=0;
all_ave_dens1(1:row_nr,1:col_nr)=0;
all_ave_dens2(1:row_nr,1:col_nr)=0;
all_ave_dens_ks(1:row_nr,1:col_nr)=0;
%%%%%%%%%%%%%%%%%% curvature %%%%%%%%%%%%%%%%%%
all_ks_curv(1:row_nr,1:col_nr)=0;
all_wilcox_curv(1:row_nr,1:col_nr)=0;
all_ave_curv1(1:row_nr,1:col_nr)=0;
all_ave_curv2(1:row_nr,1:col_nr)=0;
all_ave_curv_ks(1:row_nr,1:col_nr)=0;
%%%%%%%%%%%%%%%%%% Ripley %%%%%%%%%%%%%%%%%%%
all_ks_ripl(1:row_nr,1:col_nr)=0;
all_ks_conc(1:row_nr,1:col_nr)=0;
all_start_delta(1,1:col_nr)=0;
