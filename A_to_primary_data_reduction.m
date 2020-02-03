


if status==1 || status==2
   dat1or=dat1;
   dat2or=dat2;
   N1or=N1;
   N2or=N2;
   prestatus=status;
end
if status==5
disp('Data are reduced to primary clusters') 
msgbox('Data are reduced to primary clusters','INFO','modal')    
else
ep=find(cl1>0);
dato=dat1(ep,:);
clear('dat1')
dat1=dato;
N1=size(dat1,1);
clear('dato','ep')
ep=find(cl2>0);
dato=dat2(ep,:);
clear('dat2')
dat2=dato;
N2=size(dat2,1);
clear('dato','ep')
status=5;
disp('Data reduced to primary clusters')
plot_reduction;
msgbox('Data has been reduced','INFO','modal')
end
