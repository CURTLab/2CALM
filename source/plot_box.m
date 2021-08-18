
function h =plot_box(vb)

xm=vb(1,1);
xM=vb(1,2);
ym=vb(1,3);
yM=vb(1,4);

if xm==xM
    xM=xm+2;
    xm=xm-2;
end
if ym==yM
    yM=ym+2;
    ym=ym-2;
end





h=line([xm,xm],[ym,yM]);
set(h,'LineWidth',1,'Color','r')
hold on
h=line([xM,xM],[ym,yM]);
set(h,'LineWidth',1,'Color','r')
h=line([xm,xM],[ym,ym]);
set(h,'LineWidth',1,'Color','r')
h=line([xm,xM],[yM,yM]);
set(h,'LineWidth',1,'Color','r')
end