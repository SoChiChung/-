function [skw]=skw(xi)
%xi表示投资比例 skw 偏度
load('mydata/data.mat');
xi_r=xi';%xi原本是1xn，为了点乘转置
skw=Skw(sum(xi_r.*r)-tao);
end

function Skw = Skw(X)
%可能性偏度
% X为模糊数 【a,b,alpha,beta】
a=X(1);
b=X(2);
alpha=X(3);
beta=X(4);

Skw=19/1080*(beta^3-alpha^3)+(alpha*beta^2-beta*alpha^2)/72+(b-a)*(beta^2-alpha^2)/24;
end