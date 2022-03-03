options.Interpreter = 'tex';
options.Default = 'STOP';

button = questdlg(['\fontsize{12}STOP: Too small sample size. Sample1: ',num2str(N1),' and Sample2: ',num2str(N2),' points'],'size','SELECT OTHER SAMPLE','STOP',options);

switch button
    case 'SELECT OTHER SAMPLE'
       
           close
           clear('button')
           clear
            A_load_data;
            quit cancel;
    case 'STOP'
            close
            clear('button')
            clear('nmin')
            A_start;
            quit cancel;
           
           
end