function VarUp =VarUp(X)
%上可能性半方差
% X为模糊数 【a,b,alpha,beta】
a=X(1);
b=X(2);
alpha=X(3);
beta=X(4);

VarUp=(((b-a)/2+(alpha+beta)/6)^2+beta^2/18);
end