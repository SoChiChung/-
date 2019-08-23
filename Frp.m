function Frp=Frp(xi)
%资产组合模糊性
load('mydata/data.mat');

[row,~]=size(X);

for i=1:row
    Frp(i,:)=xi.*F(r(i,:))-F(tao);
end

Frp=sum(Frp)/4;
end

