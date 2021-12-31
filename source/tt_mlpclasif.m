
clc


load ('MLP.mat')

clc


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

ww=net(in');
ww=ww';
prob=mean(ww);
prob2=confusion(ou',ww');
Sim_MLP(iw,kw)= prob(:,1);

disp([' Probability: similarity',' ',num2str(prob(:,1)),'/',num2str(ou(1,1)),' dissimilarity ',num2str(prob(:,2)),'/',num2str(ou(1,2)),' %'])
disp('_____________________________________________________________________________________________________')
%tt_bar_mlp_rys;
clear('prob2','missc','INN','OUU')
