function [AmbRp] = AmbRp(xi)
%AMBRP �ʲ����x�Ĳ�ȷ��
%   �˴���ʾ��ϸ˵��
load('mydata/data.mat');
[row,~]=size(r);
for i=1:row
    AmbRp(i,:)=xi(i).*Amb(r(i,:));
end
AmbRp=sum(AmbRp)--Amb(tao);
end

