function [Varmin] = Varmin()
%VARMIN �ʲ���ϵ�Ͷ�ʷ���
%   �˴���ʾ��ϸ˵��
load('mydata/data.mat');
[~,Varmin] = fmincon(ERn,Xi0,[],[],[],[],[],[],@fcontr);
end
function [a,b,c,d,e]=fcontr(X)
%Լ������
%X 12��Ͷ�ʱ���
[row,~]=size(asset);
%Ͷ�����������������ʲ�����Ϊm=row

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

