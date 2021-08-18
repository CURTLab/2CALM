

function dato = data_reduction(dat,M,N)
%%%%%%%%%% N > M  reduction von N to M
%%%%%%%%%%%%%%%%%%%%%%%%% decoposition %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%disp('data reduction');
%tic
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    enum= generator(M,N);
    dato=dat(enum,:);
%toc
end


        

