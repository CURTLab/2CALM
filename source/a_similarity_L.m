


function [siml,simlv] = a_similarity_L(ci_low,ci_up,average,alp)

n=length(ci_up);
cr(1:n)=alp;

upk=ci_up;
lok=ci_low;
mk=average;



pas=upk-lok;
feld1k=sum(upk-lok);
feld2k=sum(mk-lok);
ssk=lok-alp;
ep=find(ssk>=0);
ssk(ep)=0;
ssk=-ssk;
feld3k=sum(ssk);
feld0k=sum(cr);
if feld3k>feld2k
    FFk=feld0k;
else
    FFk=feld2k;
end
siml = max(1-feld3k/feld0k,0);
simlv = max(1-feld3k/FFk,0);
