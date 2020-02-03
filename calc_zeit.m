function zeit=calc_zeit(number_points)

        x=number_points;

    % Coefficients (with 95% confidence bounds):
       
       a =    0.004806 ; 
       b =   0.0004289 ; 
       c =   -0.004773  ;
       d =   -0.001349  ;
       
            zeit = a*exp(b*x) + c*exp(d*x);
       end
