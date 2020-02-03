function[con,confmatrix]= nprsim(net,inr,our)

    clear('simou')
    clear('cc')
 

    simou = net(inr);
   [con,confmatrix] = confusion(our,simou);
    
     con=1-con; 
end