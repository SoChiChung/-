function VarLowRp=VarLowRp2(xi)
%资产组合的实际总收益的下可能性半方差
%xi 比例
global data;
data=getData();
r=data.r;
tao=data.tao;
RP=xi*r-tao;
VarLowRp=VarLow(RP);

end

function VarLow =VarLow(X)
%下可能性半方差
% X为模糊数 【a,b,alpha,beta】
VarLow=(((X(:,2)-X(:,1))/2+(X(:,3)+X(:,4))/6).^2+X(:,3).^2/18);
end

