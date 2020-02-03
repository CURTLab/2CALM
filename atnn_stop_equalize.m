options.Interpreter = 'tex';
options.Default = 'NO';

button = questdlg(['\fontsize{12}Data sizes: ',num2str(N1),' and ',num2str(N2),'.  The differences in the size of the full data is too big. SUGGESTION: equalize data to  ',num2str(Nm)],...
    'EQUALIZATION','EQUALIZE','NO', options);
switch button
    case 'EQUALIZE'
        clc
        clear('button')
     if N1<N2
        dato= data_reduction(dat2,N1,N2);
        N2=length(dato(:,1));
        clear('dat2')
        dat2=dato;
        
     elseif N2<N1
        dato= data_reduction(dat1,N2,N1);
        N1=length(dato(:,1));
        clear('dat1')
        dat1=dato;
     end
     status=3;
     clear('dato')
     clear('button') 
    case 'NO'
     clc
     clear('button') 
     quit cancel;
      
end