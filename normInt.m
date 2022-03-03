

function xn=normInt(x,Imax)

xM=max(x);
xm=min(x);
xn=(x-xm)/(xM-xm);
xn=(Imax-1)*xn+1;
xn=round(xn);
end