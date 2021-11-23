A=bootprim_M;
S_size=bootprim_S_size;
M=S_size;
mpd=bootprim_mpd;
mpc=bootprim_mpc;
den_ks=bootprim_den_ks;
den_wilcox=bootprim_den_wilcox;
pd=bootprim_pd;
lo_den=bootprim_lo_den;
up_den=bootprim_up_den;
sim_mpd=bootprim_sim_mpd;
sim_lpd=bootprim_sim_lpd;
cur_ks=bootprim_cur_ks;
cur_wilcox=bootprim_cur_wilcox;
pc=bootprim_pc;
lo_cur=bootprim_lo_cur;
up_cur=bootprim_up_cur;
sim_mpc=bootprim_sim_mpc;
sim_lpc=bootprim_sim_lpc;


try
tt_rys_resam_detail_dens_prim;

 catch
     error_info;
     close all
     pause (0.1)
     A_start;
end

clear('CI','CIc','CICU','CIM','CIMc','CIPR','dowait','Nmin','options','P','pcm1',...
      'pcm2','pcmm','PP', 'S_size','si','scrsz','pc','mpwd1')
clear('apwc', 'apwcr', 'apwd', 'apwd1', 'apwg', 'av_tot', 'avg_pm', 'avg_pmc', 'crm', 'crM', 'cur_ks', 'cur_wilcox', 'curm1', 'curm2')
clear('cvalM','den_ks','den_wilcox','dis','dlm1','dlm2','ep','fig','i','lo','lo_cur','lo_den','lo_s','mpc','mpd','mpwc','mpwcr','mpwd',...
    'mpwg','pa','pa','pd','PV','pvalM','','PVc','PVM','PVMc','sim_lpc','sim_lpd','sim_mpc','sim_mpd','simlcg','simlvg','simlg',...
    'simlpg','simmcg','simmg','simmpg','tpwc','tpwcr','tpwd','tpwd1','tpwg','up','up_cur','up_den','up_s','warnun')
