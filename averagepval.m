function [pa,RE,P]=averagepval(Array1,Array2)
clear('R','RE','P')
%%%P(:,1)----- kstest i2i
%%%P(:,2)----- wilcoxon test i2i
n=size(Array1,1);
A=size(Array1,2);


R(1:A,1:A)=0;
RE(1:A)=0;
P(1:n,2)=0;

for i=1:n
 [~,p,~ ]=kstest2(Array1(i,:),Array2(i,:));
 if isnan(p)==1
     p=1;
 end
 P(i,1)=p;
 [p,~,~ ]=ranksum(Array1(i,:),Array2(i,:));
 if isnan(p)==1
     p=1;
 end
 P(i,2)=p; 
end



for i=1:A
    for k=1:A
    [~,pp,~]=kstest2(Array1(:,i),Array2(:,k)) ; 
    if isnan(pp)==1
     pp=1;
    end
    R(i,k)=pp;
    end
    RE(i)=mean(R(i,:));
end


pa=mean(RE);
end