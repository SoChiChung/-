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

[~,Emax] =fmincon(@ERn,Xi0,[],[],[],[],[],[],@fcontr);
end



function [c,ceq]=fcontr(X)
%Լ������
%X Ͷ�ʱ���
global data;
[row,~]=size(data.asset);
%Ͷ�����������������ʲ�����Ϊm
m=6;
l0=1;
var0=0.3;

f1=VarLowRp(X)-var0;
f2=sum(X)-1;

% f3=exp(1)+sum(X.*log(X));
f4=sum(sign(X))-m;
for i=1:row
    res(i,:)=amc(data.asset(i,:));
end
f5=l0-sum(X.*res);

c=[f1;f4;f5];
ceq=[f1;f2;f4;f5];
end


% function b=restrain2(X)
% %Լ������2
% [~,col]=size(X);
% b=0;
% for i=1:col
%     b=b+X(1,col)*log(X(1,col));
% end
% end


