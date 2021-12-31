

function [COR,CORA] = Concentration3D(pos,dist)
%  Calculate concentration around center of mass  statistic
% 
% 



[N,kl] = size(pos);

if kl<2 
    error('position must have min two columns'); 
end

 SP=mean(pos);
 DIA=pdist2(SP,pos);
 Rmax=500;
CO = zeros(length(dist),1);
COR=zeros(length(dist),1);
CORA=zeros(length(dist),1);
CORA(1)=0;
for k=1:length(CO)
        CO(k) = sum(sum(DIA(:) < dist(k)));
        if k>1
        CORA(k)=CO(k)-CO(k-1);
        end
        if CO(k) > 0
            CORA(k)=CORA(k)/CO(k);
        else
            CORA(k)=0;    
        end
       
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
        cot = sum(sum(DIA(:) < dist(k)));
        rand_dis=0.85*dist(k);
        inte = sum(sum(DIA(:) < rand_dis));
        
       
            if cot>0
             COR(k)=(cot-inte)/cot;
            else
              COR(k)=0;
            end
            %disp(['in ',num2str(cot),' ring ',num2str(cot-inte),' dist ',num2str(dist(k))])
          
end


end



