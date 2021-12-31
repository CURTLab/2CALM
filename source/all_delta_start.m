

ef=find(COR1>0,1,'first');
if isempty(ef)
    st1=max(dist);
else    
st1=dist(ef);
end
st1=st1/DIA1;

ef=find(COR2>0,1,'first');
if isempty(ef)
    st2=max(dist);
else   
st2=dist(ef);
end
st2=st2/DIA2;
delt=st1-st2;
all_start_delta(:,gindex)=delt; %%%%%%%%%%%%%%%%%%%%% CONCENTRATION
