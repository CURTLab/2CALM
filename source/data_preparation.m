
function [V,BC,BN,BS,VE,VPC]=data_preparation(imds) 
%loading the database from imds and coding each image as vector size1*size2.
% V  matrix of images ; colon is one image
% BC categirical label of image
% BN numerical label of image
% BS size of original image
% VE  matrix of images eigenvalues ; colon is one image-eigenvalue vector
% VPC matrix of images pricipal components (pca); colon is one image-pca vector

% imds ImageDatastore Object 

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

l=imds.Labels;
[G,id] = findgroups(l);
n_lab=[];
for i=1:size(id,1)
    n_lab(i)=numel(find(l==id(i)));
end

V=[];
BC=l';
BN=[];
clc

VE=[];
VPC=[];
nM=size(l,1);
for j=1:nM
        
            a=imread(imds.Files{j,1});
            a=double(a)/255;
            if j==10 || j==200 || j==350
            imshow(a,'InitialMagnification','fit')
            title('Example')
            pause(0.1)
            end
            BS=size(a);
            
                if numel(BS)>2
                  b=rgb2gray(a);
                else
                    BS(3)=1;
                  b=a;
                end
                
            m=min(BS(1,1:2));
            if BS(1) == BS(2)
            c=b;
            else
            c=imresize(b,[m,m]);
            end
            %c=double(b);
            d=pca(b);
          
           
           
           
            VE(:,j)=abs(eig(c));
            VPC(:,j)=[d(:,1)',d(:,2)']';
            V(:,j)=reshape(b,size(b,1)*size(b,2),1);
            BN(j)= G(j);
            BC(j)=id(G(j)); 
            disp(['Image ',num2str(j),'/',num2str(nM)]);
end        
      