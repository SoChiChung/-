function [AmbRp] = AmbRp(xi)
%AMBRP 资产组合x的不确定
%   此处显示详细说明
load('mydata/data.mat');
[row,~]=size(r);
for i=1:row
    AmbRp(i,:)=xi(i).*Amb(r(i,:));
end
AmbRp=sum(AmbRp)--Amb(tao);
end

