function Frp=Frp(xi)
%�ʲ����ģ����
load('mydata/data.mat');

[row,~]=size(X);

for i=1:row
    Frp(i,:)=xi.*F(r(i,:))-F(tao);
end

Frp=sum(Frp)/4;
end

