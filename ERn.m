function [ERn]=ERn(xi)

%�۳����׷��ú��ʲ���Ͼ�����Ŀ���������ֵ
%x �ʲ���� xi ��Ͷ�ʱ��� x0ԭͶ�ʱ���
global data ;
data = getData();
x0=[0,0,0,0,0,0,0,0,0]';

xi
ERn=ERp(xi,data.r,data.tao)-c(data.ci,xi,x0);
end

function [Ep]=ERp(x,r,tao)
%Ͷ����ϵ�ʵ��������EP
% r �����ʲ�i�ķ����ʲ������������� ��r1,r2...ri�� ģ���� 
%X XΪģ���ʲ�Ͷ�ʱ�����a,b,c,d..��sum=1
%tao Ԥ��ͨ�������� ���� ģ����
global data ;
[row,~]=size(r);
sum=0;

r=r-tao;
for i=1:row
    Ep(i,:)=sum+x(i)*(amc(data.asset(i,:)));
end

Ep
amc(tao)

% sumEp=sum(Ep,2)
[row,col]=size(Ep)
Ep=sum(Ep)-(amc(tao));
end

function [amc]=amc(X)
global data ;
% XΪģ���� ��a,b,alpha,beta��
a=X(1);
b=X(2);
alpha=X(3);
beta=X(4);

amc=(b+a)/2+(beta-alpha)/6;
end


