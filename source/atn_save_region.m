
dat(an,rgsi)= reg_id;
load(fullpath);
par.pkmatrix=daton;
par.pkdesc.desc=colhead';
tekst1=['ROI_AUT_',num2str(reg_id),'_',exname,'.mat'];
tekst=[dirname,tekst1];
save(tekst,'par')
clear('par','tekst','tekst1')
