button = questdlg('Primary cluster are extracted; Do you want to extract once more','DB_Scan','YES','NO','CANCEL','CANCEL');

switch button
    case 'YES'
         clear('button')
         dat1=dat1or;
         N1=N1or;
         dat2=dat2or;
         N2=N2or;
         a_analyse_primary_plus;
    case 'NO'
            %close all
            clear('button')
            A_stop_prim_reduction;
    case 'CANCEL'
         clear('button')
         quit cancel
end