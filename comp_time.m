
function tsec=comp_time(x)

      
%Coefficients (with 95% confidence bounds):
       p1 =   8.417e-08;  
       p2 =    0.001533 ;
       p3 =       3.673 ; 
       tsec=p1*x^2 + p2*x + p3;
end