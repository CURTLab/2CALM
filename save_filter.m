

datf=dat1;
load(fullpath1);
par.pkmatrix=datf;
tekst1=['FILTER_',exname1,'.mat'];
tekst=[dirname1,tekst1];
save(tekst,'par');
dat1=datf;
clear('datf','par','tekst','tekst1`')


datf=dat2;
load(fullpath2);
par.pkmatrix=datf;
tekst1=['FILTER_',exname2,'.mat'];
tekst=[dirname2,tekst1];
save(tekst,'par');
dat2=datf;
clear('datf','par','tekst','tekst1`')