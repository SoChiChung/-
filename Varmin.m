function [Varmin] = Varmin()
%VARMIN 资产组合的投资风险
%   此处显示详细说明
load('mydata/data.mat');
[~,Varmin] = fmincon(ERn,Xi0,[],[],[],[],[],[],@fcontr);
end
function [a,b,c,d,e]=fcontr(X)
%约束条件
%X 12个投资比例
[row,~]=size(asset);
%投资者所允许持有最大资产种数为m=row

var0=0.3:0.1:0.5;

a=sum(X)-1;
b=sum(X.*log(X))-exp(1);
c=sum(sign(X))-row;

for i=1:row
    res(i,:)=amc(asset(i,:));
end
d=l0-sum(X.*res);
e=VarLowRp(xi)-var0;
end

