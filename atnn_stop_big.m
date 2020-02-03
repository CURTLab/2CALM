options.Interpreter = 'tex';
options.Default = 'NO';


button = questdlg(['\fontsize{12}Data sizes: ',num2str(N1),' and ',num2str(N2),...
    ' Big data - full sample analysis takes a long time. \newlineSUGGESTION: reduce both data to  ',num2str(Nm)],...
    'LARGE DATA','REDUCTION','NO',options);
switch button
    case 'REDUCTION'
       
        clc
        clear('button')
        dato= data_reduction(dat1,Nm,N1);
        N1=length(dato(:,1));
        clear('dat1')
        dat1=dato;
        clear('dato')
        dato= data_reduction(dat2,Nm,N2);
        N2=length(dato(:,1));
        clear('dat2')
        dat2=dato;
        status=3;
        clear('dato')
        quit cancel;  
   
    case 'NO'
     clc
     clear('button') 
     A_start;
     quit cancel;
   
end