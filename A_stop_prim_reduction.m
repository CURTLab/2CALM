button = questdlg('Do you want to reduce data to primary clusters','Prim','YES','NO','NO');

switch button
    case 'YES'
         clear('button')
         A_to_primary_data_reduction;
    case 'NO'
            close all
            clear('button')
            quit cancel
   
end