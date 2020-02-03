function [xi,yi,zi,ini,sxi,szi,fri,lasti,rgi,rgfi,rgsi]=data_extraction_index(colhead)
%%%%%%%%%%%%%%%%%%%% column index recognition %%%%%%%%%%%%%%%%%%%%%%%
 t = strcmpi('x',colhead);
 xi=find(t>0);
 t = strcmpi('y',colhead);
 yi=find(t>0);
 t = strcmpi('z',colhead);
 zi=find(t>0);
 t = strcmpi('intensity',colhead);
 ini=find(t>0); 
 t = strcmpi('PA',colhead);
 sxi=find(t>0);
 t = strcmpi('PAZ',colhead); 
 szi=find(t>0);
 t = strcmpi('frame',colhead); 
 fri=find(t>0);
 t = strcmpi('rgall',colhead);
 rgi=find(t>0);
 t = strcmpi('rgstrong',colhead);
 rgsi=find(t>0);
 t = strcmpi('rgfilt',colhead);
 rgfi=find(t>0);
 lasti=size(colhead,2);
end