function ERn=ERn(xi)
%�۳����׷��ú��ʲ���Ͼ�����Ŀ���������ֵ
%x �ʲ���� xi ��Ͷ�ʱ��� x0ԭͶ�ʱ���
x=0;
r=0;
tao=0;
ci=0;
x0=0;
xii=[xi(1):xi(12)];
ERn=ERp(x,r,tao)-c(ci,xii,x0);
end

function Ep= ERp(x,r,tao)
%Ͷ����ϵ�ʵ��������EP
% r �����ʲ�i�ķ����ʲ������������� ��r1,r2...ri�� ģ���� 
%X XΪģ���ʲ�Ͷ�ʱ�����a,b,c,d..��sum=1
%tao Ԥ��ͨ�������� ���� ģ����

[row,~]=size(r);
Ep=0;

r=r-tao;
for i=1:row
    Ep=Ep+x(i)*(amc(x(i,:)));
end
Ep=Ep-(amc(r(i)));
end

function amc=amc(X)
% XΪģ���� ��a,b,alpha,beta��
a=X(1);
b=X(2);
alpha=X(3);
beta=X(4);

amc=(b+a)/2+(beta-alpha)/6;
end


