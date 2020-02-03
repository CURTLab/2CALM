
function tekst = sim_class(sim)
t10='strong similarity';
c10=[0.0 0.5 0.0];
t11='similarity';
c11=[0.0 0.8 0.0];
t12= 'weak similarity';
c12=[0.0 1 0.0];
t13= 'similarity on the limit of differentiation';
c13=[1 1 0.0];
t14= 'weak dissimilarity';
c14=[1 0.0 0.0];
t15='dissimilarity';
c15=[0.8 0.0 0.0];
t16= 'strong dissimilarity';
c16=[0.6 0.0 0.0];
%%%%%%%%%%%%%%%%%%%%%%%%%%%
if sim<=0.2
    tt=t16;
    ck=c16;
elseif sim<=0.3
    tt=t15;
    ck=c15;
elseif sim<=0.45
    tt=t14;
    ck=c14;
elseif sim<=0.55
    tt=t13;
    ck=c13;
elseif sim<=0.60
    tt=t12;
    ck=c12;
elseif sim<=0.8
    tt=t11;
    ck=c11;
elseif sim<=1
    tt=t10;
    ck=c10;
end

tekst=[tt,' SIM =',num2str(sim)];
