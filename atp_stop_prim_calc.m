
tim=min(N1,N2); 
tim=1.3*(comp_time(tim)/60);
tim=round(tim,2);

button = questdlg(['Do you want continue?  It will take max ',num2str(tim),' min'],'STOP','CONTINUE','STOP','CONTINUE');

switch button
    case 'STOP'
       disp('Exiting program')
       clear('button','tim')
       close all
       A_start;
       
       
    case 'CONTINUE'
       clear('button','tim')
          quit cancel;
        
end