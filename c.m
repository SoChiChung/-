function c = c(ci,xi,x0)
%���׷���
% ci ���׷��ñ���
% x0 ԭͶ�ʱ���
% xi ��Ͷ�ʱ���

[row,~]=size(ci);
c=sum(ci.*xi);
end

