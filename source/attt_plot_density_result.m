
A=bot_M;
S_size=bot_S_size;
M=S_size;
mpd=bot_mpd;
mpc=bot_mpc;
den_ks=bot_den_ks;
den_wilcox=bot_den_wilcox;
pd=bot_pd;
lo_den=bot_lo_den;
up_den=bot_up_den;
sim_mpd=bot_sim_mpd;
sim_lpd=bot_sim_lpd;
cur_ks=bot_cur_ks;
cur_wilcox=bot_cur_wilcox;
pc=bot_pc;
lo_cur=bot_lo_cur;
up_cur=bot_up_cur;
sim_mpc=bot_sim_mpc;
sim_lpc=bot_sim_lpc;
if A>1
pvalM=bot_pvalM;
cvalM=bot_cvalM;
rys_bootstrap; 
tt_rys_resam_detail_dens;
tt_rys_resam_genr_dens;
rys_bootstrap_total;
if exist('rip_PVMR','var')==1 && size(den_ks,1)==size(rip_PVMR,1)
attt_compar_ri_den;
end
else
rys_bootstrap; 
tt_rys_resam_detail_dens;
end




clear('CI','CIc','CICU','CIM','CIMc','CIPR','dowait','Nmin','options','P','pcm1',...
      'pcm2','pcmm','PP', 'S_size','si','scrsz','pc','mpwd1')
clear('apwc', 'apwcr', 'apwd', 'apwd1', 'apwg', 'av_tot', 'avg_pm', 'avg_pmc', 'crm', 'crM', 'cur_ks', 'cur_wilcox', 'curm1', 'curm2')
clear('cvalM','den_ks','den_wilcox','dis','dlm1','dlm2','ep','fig','i','lo','lo_cur','lo_den','lo_s','mpc','mpd','mpwc','mpwcr','mpwd',...
    'mpwg','pa','pa','pd','PV','pvalM','','PVc','PVM','PVMc','sim_lpc','sim_lpd','sim_mpc','sim_mpd','simlcg','simlvg','simlg',...
    'simlpg','simmcg','simmg','simmpg','tpwc','tpwcr','tpwd','tpwd1','tpwg','up','up_cur','up_den','up_s','warnun')
