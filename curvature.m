function cur=curvature(p)
%%%%%%%%%% curvature p is n x 3 matrix xyz or  n x 2 matrix xy

N=length(p(:,1));

    if N==1 
    avp=p;
    else
    avp=mean(p);
    end
    
if  N==1 
    cur=1;
elseif N==2      %%%%%%%%   N>1
    cur=0;
else
    
    if size(p,2)==3
     p(:,1)=p(:,1)-avp(1);
     p(:,2)=p(:,2)-avp(2);
     p(:,3)=p(:,3)-avp(3);
    elseif size(p,2)==2
     p(:,1)=p(:,1)-avp(1);
     p(:,2)=p(:,2)-avp(2);
    end
    S=p'*p;
    ei=eig(S);
    ss=sum(ei);
    if ss==0
        ss=1;
    end
    cur=ei(1)/ss;
end

 
end