

function [pw,apw,mpw] = and_term(v,u,w)
%%%%%%%%%%%%%% w zwischen 0.1 und 1
w2=1-w;
n=size(v,1);
a=(1-v).^2;
a1=mean(a);
b=(1-u).^2;
b1=mean(b);
c=sqrt((w*a+w2*b));
c1=sqrt((w*a1+w2*b1));
pw=1-c;
apw=1-c1;
mpw=mean(pw);
end