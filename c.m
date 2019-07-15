function c = c(ci,xi,x0)
%交易费用
% ci 交易费用比率
% x0 原投资比例
% xi 现投资比例
[row,~]=size(ci);
c=0;
for i=1:row
    c=c+ci(row)*abs(xi(i)-x0(i));
end
end

