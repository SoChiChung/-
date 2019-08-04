function [skw]=skw(xi)
%xi表示投资比例 skw 偏度
load('mydata/data.mat');
xi_r=xi';%xi原本是1xn，为了点乘转置
skw=sum(xi_r.*r)-tao;
end