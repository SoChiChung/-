function [c] = c(ci,xi,x0)
%交易费用
% ci 交易费用比率
% x0 原投资比例
% xi 现投资比例

data=getData();
c=sum(data.ci'.*(xi-x0));
end

