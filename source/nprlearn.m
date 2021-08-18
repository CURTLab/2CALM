function [netz,con] = nprlearn(in,ou,neurons)


clear('simou')
clear('net')

u=neurons;

   rng('default');

    netz = patternnet(u);
   % netz=newpr(in,ou,u);
    netz.layers{2}.transferFcn = 'softmax';
    netz.layers{1}.transferFcn = 'tansig';
    %netz.trainFcn = 'trainlm'
    netz.performFcn = 'crossentropy';
    netz.trainParam.max_fail = 10;
    netz.trainParam.epochs =1000;
    %view(netz)
  
    
   

    
    netz=init(netz);
    %netz = initnw(netz,1);
    %netz = initnw(netz,2);  
   
    netz=train(netz,in,ou);
    simou = netz(in);
    [con,~] = confusion(ou,simou);
  
    %plotconfusion(ou,simou);

disp('Training finish')  
  
disp('----------------------------------------------------------')

end
