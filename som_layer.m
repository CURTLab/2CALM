
function [net,centroids,classes]= som_layer(inputs,numClasses,epo)
rng('default')

dimensions=numClasses;  %Row vector of dimension sizes (default = [8 8])
coverSteps=100;             %Number of training steps for initial covering of the input space (default = 100)
initNeighbor=3;             %Initial neighborhood size (default = 3)
topologyFcn='hextop'; %'gridtop'       %Layer topology function (default = 'hextop')	
distanceFcn	='linkdist';    %Neuron distance function (default = 'linkdist')

net=selforgmap(dimensions,coverSteps,initNeighbor,topologyFcn,distanceFcn);
%%%%%%%%%%%%%%%%%%%%% train parameter

%net.trainFcn = 'trainru';
net.trainParam.epochs = epo;


net = train(net,inputs);
centroids = net.IW{1};
outputs = net(inputs);
classes = vec2ind(outputs);

figure
a=size(inputs,1);
plot(inputs(1,:),inputs(2,:),'.m')
hold on
plot(centroids(:,1),centroids(:,2),'ok','markerfacecolor','b')
title(['Centroids for input coordinates x=',num2str(round(a*0.3)),' and y=',num2str(round(a*0.8))])
end