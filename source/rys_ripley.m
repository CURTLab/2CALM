
clear('c0')
km1=mean(K_Array1');
km2=mean(K_Array2');
lm1=mean(L1_Array1');
lm2=mean(L1_Array2');
clear('zero')
zero(1:numel(dist))=0;
scrsz = get(0,'ScreenSize');
figure ('OuterPosition', [scrsz(3)/5 scrsz(4)/10 scrsz(4)/0.8 scrsz(4)/1.25]) ;
whitebg('w');

subplot(2,2,1)
plot(dist,K_Array1,'-g')
grid on
hold on
plot(dist,km1,'-k','linewidth',2)
hold on
xlabel('cluster max. size in nm')
ylabel('K-Ripley function')
title('Distribution of K-Ripley function for Sample 1')


subplot(2,2,2)
plot(dist,K_Array2,'-g')
grid on
hold on
plot(dist,km2,'-k','linewidth',2)
xlabel('cluster max. size in nm')
ylabel('K-Ripley function')
title('Distribution of K-Ripley function for Sample 2')
subplot(2,2,3)

plot(dist,L1_Array1,'-g')
grid on
hold on
plot(dist,lm1,'-b','linewidth',1)
%legend('K1','K2','location','NW')
plot(dist,zero,'-k','linewidth',1)
plot([maxH1,maxH1],[0,max(lm1)])
xlabel('cluster max. size in nm')
ylabel('H-Ripley function')
title(['Distribution of H-Ripley function for Sample 1: Max for d=',num2str(maxH1),' nm'])

subplot(2,2,4)
c0(1:numel(dist))=0;
plot(dist,L1_Array2,'-g')
grid on
hold on
plot(dist,lm2,'-b','linewidth',1)
plot(dist,zero,'-k','linewidth',1)
plot([maxH2,maxH2],[0,max(lm2)])

%plot(dist,c0,'-k','linewidth',1)
%legend('K1','K2','location','NW')
xlabel('cluster max. size in nm')
ylabel('H-Ripley function')

title(['Distribution of H-Ripley function for Sample 2: Max for  d=',num2str(maxH2),' nm'])

 suptitle(['K- and H-Ripley functions for ',num2str(A),' samples with ',num2str(M),' points \newline',...
     exname1,' and ',exname2])


