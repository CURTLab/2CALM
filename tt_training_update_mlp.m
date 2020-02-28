clc
close all


tt_test_data_missing;

load ('MLP.mat')
if isempty(INN)==1
    no_pair=0;
end

%save('MLP_test','PK_Array1','PK_Array2','KD_Array','KDR_Array','KC_Array','KCR_Array','PP_Array1','PP_Array2','CP_Array1','CP_Array2')
no_pair=no_pair+1;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%s%%%%%%%%%%
tt_answer_similarity;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

try
    if out==-1
    tt_mlp_update_traning_info;
    stop_training %%%%%%%%%%%%%%%%%%%%%%%%%%%% stop
    end
catch
    A_start;
end

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
    end
end

save('MLP_test','in','ou')
save('MLP.mat','INN','OUU','no_pair')


load('MLP_test.mat')
load ('MLP.mat')
INN=[INN',in']';
OUU=[OUU',ou']';
clc
mlp_info_update;
disp(['Number of training data = ',num2str(size(OUU,1))])
save('MLP.mat','INN','OUU','no_pair','net')
clear('in','ou')
clear('INN','OUU','no_pair','net')

%%%%%%%%%%%%%%%%%%%%%%%% retrain net 
clc
load ('MLP.mat')
disp('Retrain of MLP net')

mlp_answer_neurons;
if exist('NeuronNumber','var')==0 || isnan(NeuronNumber)== 1
A_start;
else
[missc,net] = nntest_nn(INN,OUU,NeuronNumber);
nntraintool close
save('MLP.mat','INN','OUU','no_pair','net')
disp('MLP net is ready to use')
end


