

function [pos,Vbox,lambda_box,lambda,avg_min_dist,inten,Inten0,IntenSum,Z]=D3_data_prep(dat,xi,yi,zi,ini,N)


pos=[dat(:,xi),dat(:,yi),dat(:,zi)];
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% intensity %%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%% global density box %%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%   max box volumen
Vbox=(max(dat(:,xi))-min(dat(:,xi)))*(max(dat(:,yi))-min(dat(:,yi)))*(max(dat(:,zi))-min(dat(:,zi)));

% global box density point/nm^3
lambda_box=N/Vbox;                          

%%%%%%%%%%%%%%%%%%%%%%%%%%%%% min distance estimation %%%%%%%%%%%%%%%%%%%%%%%%

if N < 100000
    disp(' Direct min distance calculation: Please wait')
    tic
    [dmin,avg_min_dist]=distmin_NN(pos);
    
    toc
else
   disp('Big data. Min distance estimation: Please wait ca. 25 seconds')
   [avg_min_dist,std_min_dist]=estimation_min_dist(pos);
end

  lambda = 6/(pi*(avg_min_dist^3));
  
  
  
  inten=dat(:,ini);
  [Inten0,IntenSum]= I0cal(inten,0);
  
  
  
  disp('Distance graph calculation: Please wait ')
  if N <= 10000
  Z = linkage(pos,'complete');
  elseif N < 150000
  tic
  Z = linkage(pos,'ward','euclidean','savememory','on');
  toc
  else
    tic 
   disp(' Data reduction to 140000 points, Please wait')
    N1=140000;
    dato= data_reduction(dat,N1,N);
    N=length(dato(:,1));
    clear('dat')
    dat=dato;
    clear('dato','N1') 
    pos=[dat(:,xi),dat(:,yi),dat(:,zi)];
    Z = linkage(pos,'ward','euclidean','savememory','on');
    toc  
  end
  
  
%clear('dat')
end