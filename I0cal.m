
function [Intens0,Isum]= I0cal(int_data,fig)

%I0 calculation

Intensfull = abs(int_data);
[NN,Xout] = hist(Intensfull,50);
ep= find(NN >=0.9* max(NN));
Intens0= mean(Xout(ep));
Isum=sum(Intensfull);

if fig==1
figure

bar(Xout, NN, 'g')
title(['Histogram Intensivity full. I0 = ',num2str(Intens0)])
end

end