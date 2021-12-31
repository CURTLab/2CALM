

Nmin=min(N1,N2);
if Nmin<200
    clc
    disp('Too small sample size (<200). Error');
    clear('nmin')
    stop_calculation
end
