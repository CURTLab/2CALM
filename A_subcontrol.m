
if bild==1
    close all
    atr_prim_dat_check;
    plot_prim_both;
    clear('btn','button','bild')
elseif bild==2
     close all
    atr_prim_dat_check;
    plot2D_primary_both;
    clear('btn','button','bild')
elseif bild == 3
     close all
    atr_prim_dat_check;
    atp_answer_choice_visual_sample;
    clear('btn','button','bild')
elseif bild==4
     close all
     atr_prim_dat_check;
   tt_visualitation_single;
   clear('btn','button','bild')
elseif bild==5
     atr_prim_dat_check;
   atp_answer_dens_map_choose;   
   clear('btn','button','bild')
elseif bild==6
     atr_prim_dat_check;
   atp_answer_intens_map_choose;   
   clear('btn','button','bild')
elseif bild==7
     close all
     atr_prim_dat_check;
   atp_answer_choice_standard_sample;   
   clear('btn','button','bild')
elseif bild==8
    atr_prim_dat_check;
   tt_visualiz_standard_single;   
   clear('btn','button','bild')
elseif bild==9
    atr_prim_dat_check;
   tt_visual_standard_bubble;   
   clear('btn','button','bild')
elseif bild==10
    atr_prim_dat_check;
   tt_visual_standard_single_hull;   
   clear('btn','button','bild')
end



