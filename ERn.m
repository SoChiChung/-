function ERn=ERn(xi)
%扣除交易费用后资产组合净收益的可能性期望值
%x 资产组合 xi 现投资比例 x0原投资比例
x=0;
r=0;
tao=0;
ci=0;
x0=0;
xii=[xi(1):xi(12)];
ERn=ERp(x,r,tao)-c(ci,xii,x0);
end

function Ep= ERp(x,r,tao)
%投资组合的实际总收益EP
% r 风险资产i的风险资产的名义收益率 【r1,r2...ri】 模糊数 
%X X为模糊资产投资比例【a,b,c,d..】sum=1
%tao 预期通货膨胀率 常量 模糊数

[row,~]=size(r);
Ep=0;

r=r-tao;
for i=1:row
    Ep=Ep+x(i)*(amc(x(i,:)));
end
Ep=Ep-(amc(r(i)));
end

function amc=amc(X)
% X为模糊数 【a,b,alpha,beta】
a=X(1);
b=X(2);
alpha=X(3);
beta=X(4);

amc=(b+a)/2+(beta-alpha)/6;
end


