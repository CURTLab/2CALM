clc
close all
%%%%%%%%%%%%%%%%%% test_data %%%%%%%%%%%%%%%%%%%%%%%%%%%%%

tt_test_data_missing;

load('MLP_testnr.mat')

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%s%%%%%%%%%%%%%%%%
tt_answer_similarity;

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
test_nr=test_nr+1;
if contains(exname1,'red')==1
    te1=['red',extractAfter(exname1,'red')];
elseif contains(exname1,'blue')==1
    te1=['blue',extractAfter(exname1,'blue')];
else
    te1='';
end   
if contains(exname2,'red')==1
    te2=['red',extractAfter(exname2,'red')];
elseif contains(exname2,'blue')==1
    te2=['blue',extractAfter(exname2,'blue')];
else
    te2='';
end   
te = [num2str(test_nr),'-',te1,'-',te2] ;

pat_1=['MLP_test_Nr_',te];
pat=[dirname1,pat_1];
mlp_plot_nr_test;
%helpdlg(['The MLP test is saved as test nr ',num2str(test_nr),'  in the current directory of the first sample'])
save(pat,'in','ou','exname1','exname2')
clear('pat','pat_1')
save('MLP_testnr','test_nr','para_nr')
pause(0.5)
answer_retrain;
