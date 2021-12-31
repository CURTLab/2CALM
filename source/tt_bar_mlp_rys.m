


%texname = strrep(testname,'_','-');
%texname = strrep(texname,'.mat','');
scr = get(0,'ScreenSize');
if exist('exname2','var')==0
  exname1='---';
  exname2='---';
end
%texnam= testname ;
deltt=0;

figure('Position',[0.25*scr(3)+deltt,0.15*scr(4),0.3*scr(3),0.6*scr(4)])
whitebg('w')
c = categorical({'similarity ','dissimilarity'});
bar(c,[1 1],0.96,'FaceColor',[1 1 0],'EdgeColor',[0.1 0.1 0.2],'LineWidth',2)
hold on
bar(c,ou(1,:),0.95,'g')
hold on
bar(c,prob,0.95,'r')
ats=round(prob(:,1),3,'significant');
atd=round(prob(:,2),3,'significant');
text(1.9,ats/2,[num2str(ats*100),' %'],'fontweight','bold','fontsize',14)
text(0.9,atd/2,[num2str(atd*100),' %'],'fontweight','bold','fontsize',14)
title({exname1;exname2},'Fontweight','normal')
ax1 = gca;
ax1.FontSize =10;
ylabel(' probability','fontsize',12)

 

clear('texname','ats','atd','axx','ax1')