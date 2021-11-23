if exist('dat1','var')==0 || exist('dat2','var')==0
      status=0;    
      a_info_load; 
      A_start;
      
    elseif isempty(dat1)==1 ||  isempty(dat2)==1 
      status=0;    
      a_info_load; 
      A_start;  
 end



if exist('para_nr','var')==0
     load('MLP_testnr.mat');
         che=0;
else
         che=1;
end
 
if contains(exname1,'red')==1
    te1=['red',extractAfter(exname1,'red')];
elseif contains(exname1,'blue')==1
    te1=['blue',extractAfter(exname1,'blue')];
else
    te1=[exname1(1:3),'-untitled1'];
end   
if contains(exname2,'red')==1
    te2=['red',extractAfter(exname2,'red')];
elseif contains(exname2,'blue')==1
    te2=['blue',extractAfter(exname2,'blue')];
else
    te2=[exname2(1:3),'-untitled2'];
end   
answer_pair_nr;
if strcmp(te1,te2)==0
te = [num2str(para_nr),'-',te1,'-',te2] ;
else
te = [num2str(para_nr),'--',te1,'--',te2];
end
te= ['Res-pair',te];
tekst=[dirname1,te];
[file,path,~] = uiputfile([tekst,'.mat']);
tt=[path,file];
  
%%%%%%%%%%%%%%%%%%%%%%% Header %%%%%%%%%%%%%%%%%%%%%%%%%%%
try
save(tt);
catch
    msgbox('Fullpath is not correct. Please check the directory name')
    clc
    A_start;
end

hhba=msgbox(['The current result (pair ',num2str(para_nr),') is saved in the chosen directory '],'INFO','help','modal');
clear('hhba')

if che==0
para_nr=para_nr+1;
save('MLP_testnr','test_nr','para_nr')
para_nr=para_nr-1;
end

clear('te1','te2','te','file','path','tt')

clear('che','tekst', 'te', 'te1' ,'te2' )