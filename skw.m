function [skw]=skw(xi)
%xi��ʾͶ�ʱ��� skw ƫ��
load('mydata/data.mat');
xi_r=xi';%xiԭ����1xn��Ϊ�˵��ת��
skw=sum(xi_r.*r)-tao;
end