function [Volume,Lambdabox] = Vbox(pos)
NA=size(pos,1);
Volume=(max(pos(:,1))-min(pos(:,1)))*(max(pos(:,2))-min(pos(:,2)))*(max(pos(:,3))-min(pos(:,3)));
Lambdabox=NA/Volume;
%%%%%%%%%%%%%%% Volumen in nm3 %%%%%%%%%%%%%%%%%%
end