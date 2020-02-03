




scrsz = get(0,'ScreenSize');
figure ('OuterPosition', [scrsz(3)/4.7 scrsz(4)/10 scrsz(4)/0.8 scrsz(4)/1.25]) ;
whitebg('w');

subplot('Position',[0.03, 0.11, 0.42, 0.8])
plot(xpdf1,ypdf1,'-r')
hold on
plot(xpdf2,ypdf2,'-b')
legend('sample 1','sample 2')
xlim([0,mean([max(xpdf1),max(xpdf2)])])
xlabel('relative density')
ylabel('probability')
title(['Empirical PDF: Relative density of ',nametyp,' cluster \newline p-KS-test = ',...
         num2str(a1),', p-Wilcoxon-test = ',num2str(a2)])
     
subplot('Position',[0.505, 0.11, 0.42, 0.8])
plot(xpdf1c,ypdf1c,'-r')
hold on
plot(xpdf2c,ypdf2c,'-b')
legend('sample 1','sample 2')
xlim([0,mean([max(xpdf1c),max(xpdf2c)])])
xlabel('curvature')
ylabel('probability')
title(['Empirical PDF: Curvature of ',nametyp,' cluster \newline p-KS-test = ',...
         num2str(a3),', p-Wilcoxon-test = ',num2str(a4)])
     
suptitle([' Primary cluster statistic: Radius = ',num2str(RRmax),' nm'])   


