function [CINZ,CIPCper]=CI_calcul_rapid(Ar,alp,rapid)
%%%%%%%%%%% rapid = 0 percentile and  ztest, rapid =1 zTest only

CIPCper=[];
CINZ=[];

L=size(Ar,1);

mcap = @(x)(mean(x));
for i=1:L
   % disp(['cluster size nr ',num2str(i),'/',num2str(L)])
    tem=Ar(i,:);
    s_m=std(tem);
    p_m=mean(tem);
    if rapid == 0 
    %%%%%%%%%%%%%%%%% Bias corrected percentile method.
    sci0 = bootci(1000,{mcap,tem},'alpha',alp,'type','cper');
    si_lo=max(0,p_m-sci0(1));
    si_up=max(0,sci0(2)-p_m);
       CIPCper(i,1)=sci0(1);
       CIPCper(i,2)=sci0(2);
       CIPCper(i,3)=p_m;
       CIPCper(i,4)=si_lo;
       CIPCper(i,5)=si_up;
    end   
       
       %%%%%%%%%%%%%%%%%%% ztest
    [~,~,ci,~] = ztest(tem,p_m,s_m);
    si_lo=max(0,p_m-ci(1));
    si_up=max(0,ci(2)-p_m);
    CINZ(i,1)=max(0,ci(1));
    CINZ(i,2)=max(0,ci(2));
    CINZ(i,2)=min(CINZ(i,2),1);
    CINZ(i,3)=p_m;
    CINZ(i,4)=si_lo;
    CINZ(i,5)=si_up;    
    
end %%%%%%%%%% end main loop
%%%%%%%%%% figures
 
figu=0;

if figu ==1
    scrsz = get(0,'ScreenSize');
figure('OuterPosition', [scrsz(3)/7 scrsz(4)/24 scrsz(4)/0.75 scrsz(4)/1.25]) ;
whitebg('w')
if rapid == 0
subplot(1,2,1)
plot(CIPCper(:,1:3))
hold on
plot(CIPCper(:,3),'-k')
title('Bias corrected percentile method.')
end

subplot(1,2,2)
plot(CINZ(:,1:3))
hold on
plot(CINZ(:,3),'-k')
title('Normal approx. z-test.')
end
end
