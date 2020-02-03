
if exist('dat2','var')==1
 

A_warnung_small_sample;

clc
if status==1 || status==2
   dat1or=dat1;
   dat2or=dat2;
   N1or=N1;
   N2or=N2;
 
end

%%%%%%%%%%%%%%%%% density calculation %%%%%%%%%%%%
xa=(max(dat1(:,xi1))-min(dat1(:,xi1)));
ya=(max(dat1(:,yi1))-min(dat1(:,yi1)));
za=(max(dat1(:,zi1))-min(dat1(:,zi1)));
V1=xa*ya*za;
xa=(max(dat2(:,xi2))-min(dat2(:,xi2)));
ya=(max(dat2(:,yi2))-min(dat2(:,yi2)));
za=(max(dat2(:,zi2))-min(dat2(:,zi2)));
V2=xa*ya*za;
lamb1a=N1/V1;
lamb2a=N2/V2;
lam=min(lamb1a,lamb2a);
laM=max(lamb1a,lamb2a);
fdens=laM/lam;
thre=1.4;
%%%%%%%%%%%% point number calculation 
NM = max(N1,N2);
Nm = min(N1,N2);
fdif=NM/Nm;
Thre=1.4;


disp({'Data Sizes';[ ' Sample1 ',num2str(N1),' points density ',num2str(lamb1a)];...
    [' Sample2 ',num2str(N2),' points density ',num2str(lamb2a)]})
atnn_answer_EQ;


clear('dato','V1','V2','lamb1a','lamb2a','xa','ya','za','fdens','NM','Nm','fdif','lam','laM','thre', 'Thre','tt')

end


plot_reduction;  
atnn_info_equalize;

