
clc


load ('MLP.mat')
if exist('net','var')==0
disp('Retrain of MLP net')
mlp_answer_neurons;
[missc,net] = nntest_nn(INN,OUU,NeuronNumber);
nntraintool close
save('MLP.mat','INN','OUU','no_pair','net')
disp('MLP net is ready to use')
end

if exist('dirname1','var')==0
    dirname1=[pwd,'\'];
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
utext=[dirname1,'MLP_test_*.mat'];

[pathname,dirname] = uigetfile(utext);
fullpath = fullfile(dirname,pathname);
load(fullpath);
testname=pathname;
clear('fullpath','pathname','dirname','utext')


ww=net(in');
ww=ww';
prob=mean(ww);
prob2=confusion(ou',ww');


disp([' Probability: similarity',' ',num2str(prob(:,1)),'/',num2str(ou(1,1)),' dissimilarity ',num2str(prob(:,2)),'/',num2str(ou(1,2)),' %'])
disp('_____________________________________________________________________________________________________')
tt_bar_mlp_rys;


%clear('prob','prob2','missc','ww','in','ou','INN','OUU','no_pair','testname','locall','button')
