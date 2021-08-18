



function [xhis,yhis,xpdf,ypdf,f]=testpdf(a,rys)



sss=length(a);
[ccc,ddd]=hist(a,150);
ccc=ccc/sss;


[f,xi,u] = ksdensity(a,'kernel','epanechnikov'); %'normal' (default)'box''triangle''normal'


e=find(xi>=0);
xii=xi(e);
fii=f(e);


xi=xii;
f=fii;



s1=max(f);
s2=max(ccc);
f=f/s1;
f=f*s2;
e=find(ddd>=0);
dda=ddd(e);
cca=ccc(e);

xhis=dda;
yhis=cca;





xpdf=xi;
ypdf=f;

if rys==1
figure
whitebg('w')
h=bar(xhis,yhis);
coll=[230,230,230]/255;
%set(h,'FaceColor',coll,'EdgeColor',coll)
hold on
plot(xpdf,ypdf,'-r','LineWidth',1.4)
%plot(xia,fa)
title('Non-parametic PDF. Density')
end

end
