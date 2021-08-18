clear('c0')
dlm1=median(PR_Array1');
dlm2=median(PR_Array2');
curm1=mean(CU_Array1');
curm2=mean(CU_Array2');



scrsz = get(0,'ScreenSize');
figure ('OuterPosition', [scrsz(3)/5.5 scrsz(4)/10 scrsz(4)/0.8 scrsz(4)/1.25]) ;
whitebg('w');

subplot(2,2,1)
semilogy(dist,PR_Array1,'-g')
grid on
hold on
semilogy(dist,dlm1,'-k','linewidth',2)
hold on
%semilogy(dist,dlm2,'-r','linewidth',1)
xlabel('cluster size in nm')
ylabel('log(density)')
title('relative density of cluster: Sample 1')

subplot(2,2,2)
semilogy(dist,PR_Array2,'-g')
grid on
hold on
semilogy(dist,dlm2,'-k','linewidth',2)
%semilogy(dist,dlm1,'-r','linewidth',1)
xlabel('cluster size in nm')
ylabel('log(density)')
title('relative density of cluster: Sample 2')

subplot(2,2,3)
plot(dist,CU_Array1,'-g','linewidth',1)
grid on
hold on
plot(dist,curm1,'-b','linewidth',2)
%plot(dist,curm2,'-r','linewidth',1)
ylabel('curvature')
xlabel('cluster size in nm')
title('curvature of cluster Sample 1')

subplot(2,2,4)
%c0(1:numel(dist))=0;
plot(dist,CU_Array2,'-g','linewidth',1)
grid on
hold on
plot(dist,curm2,'-b','linewidth',2)
%plot(dist,curm1,'-r','linewidth',1)
xlabel('cluster size in nm')
ylabel('curvature')
title('curvature of cluster Sample 2')
 suptitle(['{\bfRelative density and curvature distributions for ',num2str(A),' samples with ',num2str(M),' points }\newline',...
     exname1,'{\bf and }',exname2])


