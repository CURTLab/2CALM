
function UK=pvalKS(Vektor,Array_dat)
%%% Compute pval_ks between vector and samples.
% Vector should has the same number of rows as Array_dat

n=size(Array_dat);

UK=[];
for k=1:n(1)
a=Vektor(k);
b=Array_dat(k,:);
[~,uk,~]=kstest2(a,b);
UK(k,1)=uk;
end

end