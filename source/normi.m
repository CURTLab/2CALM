
function A=normi(A)
mi=min(min(A));
ma=max(max(A));
A=(A-mi)/(ma-mi);
end