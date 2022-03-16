
%%%%%%%%%%%%%%%%%% Data Loading and Info %%%%%%%%%%%%%%%

if task==1
    %a_info_start;
    %answer_parameter;
    a_start_series;
    clear('btn','button','task')
    
elseif task==2
    A_load_result;
    clear('btn','button','task')
    
elseif task == 3
    dat_test;
    plot_reduction;
    plot_shape;
    clear('btn','button','task')
    
elseif task==4
    dat_test;
    attn_plot_rip_result;
    clear('btn','button','task')
    
elseif task==5
    dat_test;
    attt_plot_density_result;
    clear('btn','button','task')
    
elseif task==6
    dat_test;
    tt_bar_mlp_rys;
    clear('btn','button','task')
    
    %%%%%%%%%%%%%%%%%%% data processing   %%%%%%%%%%%%%%%%%
    
elseif task==7
    tab_ripley;
    clear('btn','button','task')
    
elseif task==8
    tab_boot;
    clear('btn','button','task')
    
elseif task==9
    tab_mlp;
    clear('btn','button','task')
    
elseif task==10
    plot_confusion_matrix;
    clear('btn','button','task')
    
elseif task==11
    his_mlp_avp;
    clear('btn','button','task')
    
elseif task==12
    close all;
    clear('btn','button','task')
    
elseif task==13
    delete('Res*.mat');
    clear('btn','button','task')
    
elseif task==14
    load('all_compar.mat')
    zz_all_pair_rys;
    z_average;
    clear('btn','button','task')
    
elseif task==15
    close all
    clear('btn','button','task')
    user_stop
    
end

