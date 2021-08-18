clc

load ('MLP.mat')
disp('Retrain of MLP net')
mlp_answer_neurons;
[missc,net] = nntest_nn(INN,OUU,NeuronNumber);
nntraintool close
save('MLP.mat','INN','OUU','no_pair','net')
disp('MLP net is ready to use')
