function [Emax] = Emax()
%��ȡmaxE ��������ֵ���ֵ
%Xi �� �ʲ���ϵ�Ͷ�ʱ���
%data asset ��Ʊ��ģ����
global data;
data=getData();

Xi0=zeros(9,1);
Xi0(1)=1;
% �²���ܵĽ����Ϊ��� 
%Xi0 ��ʾXi����ʼֵ[1,...0]

%��w1���ұߵļ�ֵ
Xi0
[~,Emax] = fmaxcon(ERn,Xi0,[],[],[],[],[],[],@fcontr);
end



function [a,b,c,d,e]=fcontr(X)
%Լ������
%X Ͷ�ʱ���
global data;
[row,~]=size(data.asset);
%Ͷ�����������������ʲ�����Ϊm
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
% %Լ������2
% [~,col]=size(X);
% b=0;
% for i=1:col
%     b=b+X(1,col)*log(X(1,col));
% end
% end


