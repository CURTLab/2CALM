function [dens,den_av,cur,cur_av]=feature_dens_primitiv_plus(cl,pos,grose,mu,sig,midi)
%disp('feature calculation bullet')
%%%%%%%  density box %%%%%%%%%%%%

    S=max(cl);
    dens(1:S,1)=0;
    nz(1:S,1)=0;
    cur(1:S,1)=0;
    
    
  for j=1:S
        ep=find(cl==j);
        n=numel(ep);
        nz(j)=n;
        postem=pos(ep,:);
        if n==1
           if grose==0 
            av=midi(ep,:) ;
           else
            av=random('Normal',mu,sig)/2;
            av=max([5,av]); 
           end
           V=(4*pi*(av/2)^3)/3;
        else
            if grose== 0
                av=(midi(ep,:))/2;
                s=av.^3;
                v1=sum(s);
                V=(4*pi*v1)/3;
            else
                xa=max(postem(:,1))- min(postem(:,1));
                ya=max(postem(:,2))- min(postem(:,2));
                za=max(postem(:,3))- min(postem(:,3));
          %%%%%%%%%%%%%%%      
              if xa==0
                 if grose==0 
                 av=mean(midi(ep,:))/2 ;
                 else
                 av=random('Normal',mu,sig)/2;
                 av=max([5,av]);
                 end            
                 xa=av;
              end
          %%%%%%%%%%%%%%%%%%%%%
              if ya==0
                 if grose==0 
                 av=mean(midi(ep,:))/2 ;
                 else
                 av=random('Normal',mu,sig)/2;
                 av=max([5,av]);
                 end            
                 ya=av;
              end
          %%%%%%%%%%%%%%%%%%%%
              if za==0
                 if grose==0 
                 av=mean(midi(ep,:))/2 ;
                 else
                 av=random('Normal',mu,sig)/2;
                 av=max([5,av]);
                 end          
                 za=av/2;
              end
              V=xa*ya*za;
            end
        end  
  dens(j) = n/V;  
  cur(j)= curvature(postem);
  end
  den_av = mean(dens);
  cur_av = mean(cur);

end

