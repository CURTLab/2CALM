
%%%%%%%%%%%%%%%%%% Data Loading and Info %%%%%%%%%%%%%%%

if task==1
    A_load_data;
    clear('btn','button','task')

elseif task==2
    A_reload_again;
    clear('btn','button','task')

elseif task == 3
    A_plot_data_label;
    clear('btn','button','task')

elseif task==4
   a_choice_plot_reduction;
   clear('btn','button','task')

 elseif task==5  
    close all
     Figure_start;
     clear('scrsz','T')
    clear('btn','button','task')  
 
elseif task==6
 
    A_plot_status;
    clear('btn','button','task')
    
 %%%%%%%%%%%%%%%%%%% data processing   %%%%%%%%%%%%%%%%%

 elseif task==7
   A_filter;   
   clear('btn','button','task')

 elseif task==8
   ROI_MANUAL;   
   clear('btn','button','task')  
    
elseif task==9
    close all
   STOP_REGION;
   clear('btn','button','task')

elseif task==10
    stop_randomizing;
    clear('btn','button','task')

elseif task==11
   atnn_ausgleich;   
   clear('btn','button','task')

elseif task==14
   if exist('KDPRIM_Array','var')==1  && exist('dat2','var')==1
         disp('Bootstrapping analysis is carried out')
          atp_answer_boot_exists;
          clear('btn','button','task')
     elseif  exist('dat2','var')==1
        clear('btn','button','task')  
        atp_stop_fast_statistik_boot;  
     else
        status=0;
        hh11=msgbox('Sample 2 do not exists. Please load data of sample 2','INFO');
        clear('hh11')
        clear('btn','button','task')
        A_start;
   end
    clear('btn','button','task')  

%%%%%%%%%%%%%%%%%%%% Analysis %%%%%%%%%%%%%


elseif task==12
   if exist('PK_Array2','var')==1  && exist('dat2','var')==1
        clear('btn','button','task') 
        answer_ripley_exists;
    elseif  exist('dat2','var')==1 && isempty(dat2)==0
        clear('btn','button','task')
        stop_fast_statistic;
    else
        status=0;
        hh11=msgbox('Sample 2 do not exists. Please load data of sample 2','INFO');
        clear('hh11')
        clear('btn','button','task')
    end

elseif task==13
    
     if  exist('KD_Array','var')==1 && exist('dat2','var')==1 
         disp('Bootstrapping analysis is carried out')
          clear('btn','button','task')
          answer_boot_exists;
     elseif  exist('dat2','var')==1 
          clear('btn','button','task')  
          stop_fast_statistik_boot;  
     else
        status=0;
        clear('btn','button','task')
        a_info_load
        A_start;
     end
   
   
elseif task==16
    
   if exist('cl2','var')== 1
       disp('primary cluster exist')
       A_stop_primary;
   else 
      a_analyse_primary_plus; 
   end
   
   clear('btn','button','task')

%%%%%%%%%%%%%%%%%%%%Visualization %%%%%%%%%%%%%%%%%%

elseif task==17
  if exist('cl2','var')== 0
       disp('primary cluster do not exist')
       %msgbox('Primary cluster do not exist','INFO')
       A_submenu;
       A_subcontrol
  else 
       if exist('largp2','var')==0
         disp('primary cluster do not exist')
         msgbox('Largest primary cluster do not exist. Perform primary clustering','INFO','modal')
       else
           if exist('posprim2','var')==0  
              disp('cluster do not exist')
               msgbox('Primary cluster do not exist. Perform primary clustering','INFO','modal')
               A_submenu;
               A_subcontrol
           else
               A_submenu;
               A_subcontrol;
           end
       end
  end
 clear('btn','button','task')

elseif task==15
    clear('btn','button','task')
    stop_mlp; 
%%%%%%%%%%%%%%%%%% Save and load results %%%%%%%%%%%%%%%%%

elseif task==18
    clear('btn','button','task')
    A_save_res_inter; 

elseif task==19
    clear('btn','button','task')
    A_load_result;    

%%%%%%%%%%%%%%%%%%%%%%%%%%% Stop %%%%%%%%%%%%%%%%%%%    
elseif task==20
    close all
    clear('btn','button','task')
    E_read;
      
        
        
elseif task==21
    close all
    clear('btn','button','task')
    user_stop
end

