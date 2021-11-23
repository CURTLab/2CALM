

proc=0.01;
INS=INN;
N=size(INS,1);
M=size(INS,2);
INSOU=[INS,OUU];
tesstnum=round(proc*N);
ep=randi(N,tesstnum,1);

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

if exist('net','var')==0
disp('Net do not exists. Training of MLP net')
mlp_answer_neurons;
[missc,net] = nntest_nn(INN,OUU,NeuronNumber);
nntraintool close
save('MLP.mat','INN','OUU','no_pair','net')   
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%% data for CNN %%%%%%%%%%%%%%%%%%
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

if exist('net_cnn','var')==0
disp('CNN net do not exists. Training of CNN net')
CNN_1D;
save('MLP.mat','INN','OUU','no_pair','net','net_cnn')
disp('CNN-net is ready to use')
end
load('MLP.mat');
clc