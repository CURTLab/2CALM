function [dens_prim,raad]=density_box_primitiv(pos1,n)

 xa=max(pos1(:,1))- min(pos1(:,1));
 ya=max(pos1(:,2))- min(pos1(:,2));
 za=max(pos1(:,3))- min(pos1(:,3));
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
  dens_prim = n/V;   
  raad=nthroot(V,3);  
         

end