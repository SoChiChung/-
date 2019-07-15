function E= E(X)
%可能性均值
% X为模糊数 【a,b,alpha,beta】
a=X(1);
b=X(2);
alpha=X(3);
beta=X(4);

E=(3*(a+b)+beta-alpha)/6;
end

