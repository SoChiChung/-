function [skw]=skw(xi)
%xi��ʾͶ�ʱ��� skw ƫ��
load('mydata/data.mat');
xi_r=xi';%xiԭ����1xn��Ϊ�˵��ת��
skw=Skw(sum(xi_r.*r)-tao);
end

function Skw = Skw(X)
%������ƫ��
% XΪģ���� ��a,b,alpha,beta��
a=X(1);
b=X(2);
alpha=X(3);
beta=X(4);

Skw=19/1080*(beta^3-alpha^3)+(alpha*beta^2-beta*alpha^2)/72+(b-a)*(beta^2-alpha^2)/24;
end