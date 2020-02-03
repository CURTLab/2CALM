function [v,c,xm,xM,ym,yM]= Int_map_Vor(primar,centroid,subcentroid)

if primar==1
 xx=subcentroid(:,1);
 yy=subcentroid(:,2);
 zz=subcentroid(:,3);
 WW=subcentroid(:,1:2);
 WW3=subcentroid(:,1:3);
 end
 x=centroid(:,1);
 y=centroid(:,2);
 z=centroid(:,3);
 W=centroid(:,1:2);
 W3=centroid;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 2D intensiity map
 if primar==1
 [v,c]=voronoin(WW,{'Qbb'}) ;
 else
 [v,c]=voronoin(W,{'Qbb'}) ;
 end
 xm=min(x);
 xM=max(x);
 ym=min(y);
 yM=max(y);
 
end