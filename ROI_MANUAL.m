close all

a_answer_sample2roi;
if exist('dat','var')==1

boxrec=[];
try
hrec =  imrect;
prec = getPosition(hrec);
catch
close all
helpdlg('Calculations had been aborted','load1 message')
A_start;
end

boxrec(1,1)=prec(1);
boxrec(1,2)=prec(1)+prec(3);
boxrec(1,3)=prec(2);
boxrec(1,4)=prec(2)+prec(4);

a = plot_box(boxrec);
delete(hrec)

ep =find(dat(:,xi)>=boxrec(1,1)& dat(:,xi)<=boxrec(1,2)& dat(:,yi)>=boxrec(1,3)& dat(:,yi)<=boxrec(1,4));

datr=dat(ep,:);
plot_original_data_12d(datr(:,xi),datr(:,yi),datr(:,zi),exname);



load(fullpath);
par.pkmatrix=datr;
try
a_ans_saveRoi;
catch

helpdlg('Calculations had been aborted','load message')

end
close all



clear('a','ep','hrec','boxrec','prec','datr','tekst1','tekst','par','ROI_nr')

else
A_start;
end