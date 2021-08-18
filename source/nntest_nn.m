function [missc,net] = nntest_nn(VM,CL,NeuronNumber)
  
if isempty(VM)==0
    proc=0.10;
 
    
    u=NeuronNumber; %%%%%%%%%%%%%% neurons number 
    
    [vt,ct,vr,cr]= trainset_n(VM,CL,proc);
    Lt=length(vt(:,1));
    Lr=length(vr(:,1));
    int=vt';
    inr=vr';
    out=ct' ; 
    our=cr';
   
    rng('default')
    [net,~] = nprlearn(inr,our,u);
    [conf,~]= nprsim(net,int,out);
    
   missc=1-conf;
else
    missc=1;
end
end