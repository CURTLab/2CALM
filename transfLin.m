
function tra=transfLin(larg,ptyp)
%%%%%%%%%%%%%%% ptyp =1 large =3 density = 4 intensity

den=larg(:,ptyp);
den=sort(den,'ascend');

ilo=size(den,1);
del=1/ilo;

dl= 0:del:1;
dll=dl(2:end);
uz=normi(den);
tra=[den,dll',uz];

end
