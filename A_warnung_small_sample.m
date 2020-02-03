

nmin=min(N1,N2);
if nmin<200
    clc
    disp('Too small sample size. Select other sample');
    answer_too_small_region;
    
end
clear('nmin')