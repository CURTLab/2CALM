lamb1a=N1/V1;
lamb2a=N2/V2;


if N1<=N2
    N1n=(N1*V2)/V1;
    N1n=min(N1n,0.95*N2);
    N1n=round(N1n);
        dato= data_reduction(dat2,N1n,N2);
        N2=length(dato(:,1));
        clear('dat2','N1n')
        dat2=dato;
elseif N2<N1
        N2n=(N2*V1)/V2;
        N2n=min(N2n,0.95*N1);
        N2n=round(N2n);
        dato= data_reduction(dat1,N2n,N1);
        N1=length(dato(:,1));
        clear('dat1','N2n')
        dat1=dato;
end
lamb1=N1/V1;
lamb2=N2/V2;
status=3;
clc
disp(['lamda alt = ',num2str(lamb1a),' ',num2str(lamb2a)]);
disp(['lamda new = ',num2str(lamb1),' ',num2str(lamb2)]);


clear('dato','V1','V2','lamb1a','lamb2a','xa','ya','za','fdens')