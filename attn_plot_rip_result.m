

mpw=rip_mpw;
tpw=rip_tpw;
lok=rip_lok;
upk=rip_upk;
tpw=rip_tpw;
pvalM=rip_pvalM;

A=rip_M;
M=rip_M;
S_size=rip_size;
simriplK=result_Ri_aggreg_siml;
simripK=result_Ri_aggreg_simm;


 if A==1
      p_val_K_singel = rip_ks ;
      p_val_W_singel=rip_w;
      attn_res_ri_single;
      clear('p_val_W_singel' ,'p_val_K_singel')

 else
    rys_ripley;
    rys_ripley_empiricp;
    tt_rys_resam_gen_ripley;
    rys_ripl_total;
 end


clear('mpw','tpw','lok','upk','simriplK','simripK','S_size','A')

clear('av_tot','avg_pm', 'avg_pmc','CI','CIMR', 'CIMRc', 'CIripK' ,'crm', 'dis', 'lm1', 'lm2', 'Nmin',...
'options', 'PP', 'PVMR' ,'PVMRc', 'PVR', 'PVRc',...
'siml_r', 'simlc_r', 'simm_r', 'simmc_r' ,'zero')
