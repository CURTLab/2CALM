
clc
if exist('para_nr','var')==1
    para_nr_orig=para_nr;
end
    
load ('MLP.mat')
if exist('net','var')==0
msgbox('MLP net do not exists')
Training_networks_neu;
end
if exist('net_cnn','var')==0
msgbox('CNN net do not exists')   
Training_networks_neu;
end


if exist('dirname1','var')==0
    dirname1=[pwd,'\'];
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
utext=[dirname1,'MLP_test_*.mat'];

[pathname,dirname] = uigetfile(utext);
fullpath = fullfile(dirname,pathname);
load(fullpath);
newStr = extractBetween(pathname,'test_Nr_','-');
newTit=newStr{1};
testname=['Pair Nr ',newTit];

clear('fullpath','pathname','dirname','utext','newStr','newTit')

%%%%%%%%%%%%%%%%%%% classification with MLP %%%%%%%%%%%%%%%%%%%%%
ww=net(in');
ww=ww';
prob=mean(ww);
prob2=confusion(ou',ww');

deltt=0;
disp(['MLP Probability: similarity',' ',num2str(prob(:,1)),'/',num2str(ou(1,1)),' dissimilarity ',num2str(prob(:,2)),'/',num2str(ou(1,2)),' %'])
disp('net_____________________________________________________________________________________________________')
TES='MLP';
tt_bar_mlp_rys;

tt_cnn_clasif;
disp(['CNN Probability: similarity',' ',num2str(prob(:,1)),'/',num2str(ou(1,1)),' dissimilarity ',num2str(prob(:,2)),'/',num2str(ou(1,2)),' %'])
disp('cnn_____________________________________________________________________________________________________')
TES='CNN';
deltt=0.3*scr(3);
tt_bar_mlp_rys;


if exist('para_nr_orig','var')==1
    para_nr=para_nr_orig;
end


clear('para_nr_orig')

%clear('prob','prob2','missc','ww','in','ou','testname','locall','button','TES','deltt')
