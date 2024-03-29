function [pvala,x,f]=pval(data,simdata,t,prec)

if nargin<4 
    prec=1e4; 
end

if isempty(t)
    x=linspace(min(simdata),max(simdata),prec);
    for j=1:prec
        f(j)=nnz(simdata<x(j));
    end
    if max(f) > 0
        f=f/max(f);
    else
        f = ones(1,length(f));
    end
    [a idx]=min(abs(x-data));
    pv=(2*f(idx)*(f(idx)<0.5))+(2*(1-f(idx))*(f(idx)>0.5));
else
    for i=1:numel(t)
        x=linspace(min(simdata(:,i)),max(simdata(:,i)),prec);
        for j=1:prec
            f(j)=nnz(simdata(:,i)<x(j));
        end
        if max(f) > 0
            f=f/max(f);
        else
            f = ones(1,length(f));
        end
        [a idx]=min(abs(x-data(:,i)))
        pv(i)=(2*f(idx)*(f(idx)<=0.5))+(2*(1-f(idx))*(f(idx)>0.5));
    end
end
pvala=pv;