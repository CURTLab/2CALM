function K = RipleysK3D(pos,pdistm,dist,box,method)
% RipleysK: Calculate K statistic
% 
% K = RipleysK(pos,pdistm,dist, box,method) calculates G, the K statistic at each 
% distance for the data with x-y-z coordinates given by pos, and the
% bounding rectangle given by box=[minX maxX minY maxY minZ maxZ].
% If method=0, no edge correction is applied.
% If method=1, points are only used if they are at least h units away from
% the edge.
%
% Note: The L statistic may be calculated from the K statistic as follows: 
%   L = sqrt(K/pi)-h;
%   


genau=0;
% genau=0 volumen of sample as vol bounding box
% genau=1 volumen of sample as vol convexhull
if nargin<4
    method=1; 
end

[N,k] = size(pos);

if k<2 
    error('position must have min two columns'); 
end

K = zeros(length(dist),1);
if method==1
    for k=1:length(K)
    at= pdistm(:,1) < dist(k);
    at=double(at);
    bt=pdistm(:,2:4)/dist(k);
    bt=(1+bt)/2;
    bt(:,1)=min(at,bt(:,1));
    bt(:,2)=min(at,bt(:,2));
    bt(:,3)=min(at,bt(:,3));
    ct=bt(:,1).*bt(:,2);
    ct=ct.*bt(:,3);
      K(k) = sum(sum(ct))/N;
     end
elseif method==0
        K = zeros(length(dist),1);
    for k=1:length(K)
        K(k) = sum(sum(pdistm(:,1) <dist(k)))/N;
    end
    
elseif method==2
  rbox = min([pos(:,1)'-box(1);box(2)-pos(:,1)';pos(:,2)'-box(3); box(4)-pos(:,2)';pos(:,3)'-box(5); box(6)-pos(:,3)'] );
  rbox=rbox';
  for k=1:length(K)
    I = find(rbox>dist(k));
    if isempty(I)== 0
        K(k) = sum(sum(pdistm(I,1)<dist(k)))/length(I);
    else
        K(k) = sum(sum(pdistm(:,1) <dist(k)))/N;
    end
  end
    
end


if genau==1
[~,v] = convhulln(pos);   
lambda = N/v;
else
lambda = N/((box(2)-box(1))*(box(4)-box(3))*(box(6)-box(5)));
end
K = K/lambda;






end



