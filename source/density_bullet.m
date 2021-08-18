function dens=density_bullet(pos1,pos)
 %clc
% tic
 %disp('cluster density calculation - sum of bullet volume');
 n=size(pos1,1);
 
 if n >= 6500
    s(1,1:n)=0;
    for jk=1:n
        a=pdist2(pos1(jk,:),pos1(:,:)); 
        a(jk)=1.e+10;
        s(jk)=min(a);
    end
    clear('a','jk')
    
 elseif n > 1 && n < 6500
     U=pdist2(pos1,pos1);
     U=sort(U);
     s=U(2,:);
     clear('U')
     
 elseif n==1
     a=pdist2(pos1,pos);
     ee=find(a==0);
     if isempty(ee)==0
         a(ee)=1.e+10;
     end
     s=min(a);
     clear('a')
 end            
  
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 dens=sum(s.^3);
 if dens == 0   
    dens=100^3;
 end
 dens = (6*n)/(pi*dens);
 clear('s')
 %toc
end
       


     
     
