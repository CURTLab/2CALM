function dens=density_box(pos1,pos)
 %clc
% tic
% disp('cluster density calculation - box volume');
 n=size(pos1,1);
 
 xa=max(pos1(:,1))- min(pos1(:,1));
 ya=max(pos1(:,2))- min(pos1(:,2));
 za=max(pos1(:,3))- min(pos1(:,3));
 
 
    
 if n==1
     a=pdist2(pos1,pos);
     ee=find(a==0);
     if isempty(ee)== 0
         a(ee)=1.e+10;
     end
     s=min(a);
        xa=s;
        ya=s;
        za=s;
 end
 clear('a','ee','s') 
 
  if xa==0
      xa=5;
  end
  if ya==0
      ya=5;
  end
  if za==0
      za=5;
  end
  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  V=xa*ya*za;    
  dens = n/V;   
     
  %toc          

end
       


     
     
