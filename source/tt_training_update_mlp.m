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

save('MLP.mat','INN','OUU','no_pair')
clear('in','ou')
clear('INN','OUU','no_pair','net')

%%%%%%%%%%%%%%%%%%%%%%%% retrain net 
clc
load ('MLP.mat')
disp('Retrain of MLP net')

mlp_answer_neurons;
if exist('NeuronNumber','var')==0 || isnan(NeuronNumber)== 1
     msgbox('Wrong Neurons Number')   
     A_start;
else
    %%%%%%%%%%%%%% Training MLP %%%%%%%%%%%%%%%%%
    [missc,net] = nntest_nn(INN,OUU,NeuronNumber);
    nntraintool close
    save('MLP.mat','INN','OUU','no_pair','net')
    disp('MLP net is ready to use')
%%%%%%%%%%%%%%%%%%% Trainig CNN %%%%%%%%%%%%%%%%
    proc=0.01;
    INS=INN;
    N=size(INS,1);
    M=size(INS,2);
    INSOU=[INS,OUU];
    testnum=round(proc*N);
    ep=randi(N,testnum,1);
    Test1=INSOU(ep,:);
    INSOU(ep,:)=[];
    Train1=INSOU;
%%%%%%%%%%%%%%%%%%%%%
    clear('INSOU')
    Testx=Test1(:,1:M);
    Testy=Test1(:,12:13);
    clear('Test1')
    Trainx=Train1(:,1:M);
    Trainy=Train1(:,12:13);
    clear('Train1')
disp('CNN Train-Data Preparation')
%%%%%%%%%%%%%%%%%%%%%%%%%%%%% data for CNN %%%%%%%%%%%%%%%%%%
    Trai_x=Trainx';
    Trai_x(1,:)=Trai_x(1,:)/100;
    N1=size(Trai_x,2);
    trainD=[];

    for i=1:N1
        trainD(:,:,:,i)=Trai_x(:,i);
    end
    tr=Trainy(:,1)';
    targetD=categorical(tr);
    clear('Trai_x','tr')
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    Test_x=Testx';
    Test_x(1,:)=Test_x(1,:)/100;
    N2=size(Test_x,2);
    testD=[];

    for i=1:N2
       testD(:,:,:,i)=Test_x(:,i);
    end
    tr=Testy(:,1)';
    testtagetD=categorical(tr);
    clear('Test_x','tr')
    disp('Retrain of CNN net')
    CNN_1D;
    save('MLP.mat','INN','OUU','no_pair','net','net_cnn')
    disp('CNN-net is ready to use')
end
msgbox('MLP-net and CNN-net are ready to use')
load('MLP.mat');
clc
A_start;