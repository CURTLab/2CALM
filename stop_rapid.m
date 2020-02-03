

rapid=0;
button = questdlg(['Data sizes: ',num2str(N1),' and ',num2str(N2),'. Rapid extraction of primary clusters: reduce both data '],...
    'STOP RAPID ','RAPID','NO','NO');
switch button
    case 'RAPID'
        status=3;
        answer_rapid;
        clc
        clear('button')
 if nmin==N1
    dato= data_reduction(dat2,nmin,N2);
        N2=length(dato(:,1));
        clear('dat2')
        dat2=dato;
        clear('dato')
elseif nmin==N2
     dato= data_reduction(dat1,nmin,N1);
        N1=length(dato(:,1));
        clear('dat1')
        dat1=dato;
        clear('dato')
else
    dato= data_reduction(dat2,nmin,N2);
        N2=length(dato(:,1));
        clear('dat2')
        dat2=dato;
        clear('dato')
        dato= data_reduction(dat1,nmin,N1);
        N1=length(dato(:,1));
        clear('dat1')
        dat1=dato;
        clear('dato')
end

        rapid=1;
        status=3;
        quit cancel;  
 clear('nmin','button')  
 
    case 'NO'
      atp_stop_prim_calc;
      
      if abs(N1-N2)>5000
        clc
        clear('button')
         if N1<N2
             dato= data_reduction(dat2,N1,N2);
             N2=length(dato(:,1));
             clear('dat2')
             dat2=dato;
             clear('dato')
         elseif N2<N1
             dato= data_reduction(dat1,N2,N1);
             N1=length(dato(:,1));
             clear('dat1')
             dat1=dato;
             clear('dato')
         end
     status=3;
     clear('button')   
      end
      clc
     clear('button') 
     disp('Data are equalized to smaller sample and DB-Scan is running')
     quit cancel;
 end