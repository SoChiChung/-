function [Emax] = Emax()
%获取maxE 收益期望值最大值
%Xi ： 资产组合的投资比例
%data asset 股票的模糊数
global data;
data=getData();

Xi0=zeros(9,1);
Xi0(1)=1;
% 猜测可能的结果作为起点 
%Xi0 表示Xi的起始值[1,...0]

%求w1的右边的极值
Xi0
[~,Emax] = fmaxcon(ERn,Xi0,[],[],[],[],[],[],@fcontr);
end



function [a,b,c,d,e]=fcontr(X)
%约束条件
%X 投资比例
global data;
[row,~]=size(data.asset);
%投资者所允许持有最大资产种数为m
m=6;
var0=0.3:0.1:0.5;

a=sum(X)-1;
b=sum(X.*log(X))-exp(1);
c=sum(sign(X))-m;

for i=1:row
    res(i,:)=amc(data.asset(i,:));
end
d=l0-sum(X.*res);
e=VarLowRp(xi)-var0;
end


% function b=restrain2(X)
% %约束条件2
% [~,col]=size(X);
% b=0;
% for i=1:col
%     b=b+X(1,col)*log(X(1,col));
% end
% end


