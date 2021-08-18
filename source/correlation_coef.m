function cor=correlation_coef(Array1,Array2)
u=corrcoef(Array1,Array2);
cor = abs(u(1,2));
end