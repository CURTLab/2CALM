
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%    average densty 

if exist('PR_Array1','var')==1
    mden1=mean(PR_Array1,2);
    mden2=mean(PR_Array2,2);



scrsz = get(0,'ScreenSize');
figure ('OuterPosition', [scrsz(3)/4.5 scrsz(4)/10 scrsz(4)/1.2 scrsz(4)/1.25]) ;
whitebg('w');
grid on
hold on
plot(dist,mden1,'-b','linewidth', 2)
hold on
plot(dist,mden2,'-r','linewidth', 2)
legend('Sample 1','Sample 2')
xlabel('cluster max dimension in nm')
ylabel(' average of the relative density of clusters')
%ylim([0,1])
xlim([0,max(dist)])
title (['Average of relative cluster-density\newline S1:'  ,exname1,' \newline S2:',exname2])

end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

if exist('NZ_Array1','var')==1
    mnz1=mean(NZ_Array1,2)*100;
    mnz2=mean(NZ_Array2,2)*100;
    scrsz = get(0,'ScreenSize');
    figure ('OuterPosition', [scrsz(3)/2.5 scrsz(4)/10 scrsz(4)/1.2 scrsz(4)/1.25]) ;
    whitebg('w');
    grid on
    hold on
    plot(dist,mnz1,'-b','linewidth', 2)
    hold on
    plot(dist,mnz2,'-r','linewidth', 2)
    legend('Sample 1','Sample 2')
    xlabel('cluster max dimension in nm')
    ylabel('average of relative cluster sizes in %')
    xlim([0,max(dist)])
    title ('Average of relative cluster sizes in %\newline(size=mean of number of points inside cluster/number of all points)')
end

  clear('mden1','mden2','mnz1','mnz2','scrsz') 
    
    
    
    