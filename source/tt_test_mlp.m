
close all
%%%%%%%%%%%%%%%%%% test_data %%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%tt_test_data_missing;


   if exist('test_nr','var')==0
   test_nr=0
   end


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%s%%%%%%%%%%%%%%%%

out=-1;


temp=[size(KD_Array)',size(PP_Array1)',size(PK_Array1)',size(PP_Array1)']';
Tem=min(temp);

M=Tem(:,2);
L=Tem(:,1);
clear('temp','Tem')
n=0;
in=[];
ou=[];
for i=1:L
    for k=1:M
         n=n+1;
         u=[i,KD_Array(i,k),KDR_Array(i,k),KC_Array(i,k),KCR_Array(i,k),PP_Array1(i,k),PP_Array2(i,k),CP_Array1(i,k),...
             CP_Array2(i,k),PK_Array1(i,k),PK_Array2(i,k)];
         in(n,:)=u;
         ou(n,:)=[out,1-out];
       if out==-1
         ou(n,:)=[0,0];
        end
    end
end
tt_mlpclasif;

