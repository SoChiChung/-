function [ERn]=ERn(xi)

%�۳����׷��ú��ʲ���Ͼ�����Ŀ���������ֵ
%x �ʲ���� xi ��Ͷ�ʱ��� x0ԭͶ�ʱ���
global data ;
data = getData();
x0=[0,0,0,0,0,0,0,0,0]';

e=ERp(xi,data.r,data.tao);
cc=c(data.ci,xi,x0);
ERn=e-cc;
end

function [Ep]=ERp(x,r,tao)
%Ͷ����ϵ�ʵ��������EP
% r �����ʲ�i�ķ����ʲ������������� ��r1,r2...ri�� ģ���� 
%X XΪģ���ʲ�Ͷ�ʱ�����a,b,c,d..��sum=1
%tao Ԥ��ͨ�������� ���� ģ����
global data ;
[row,~]=size(r);
Esum=0;

r=r-tao;
for i=1:row
    Ep(i,:)=Esum+x(i)*(amc(data.asset(i,:)));
end



% sumEp=sum(Ep,2)
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


