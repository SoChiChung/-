function [c] = c(ci,xi,x0)
%���׷���
% ci ���׷��ñ���
% x0 ԭͶ�ʱ���
% xi ��Ͷ�ʱ���

data=getData();
c=sum(data.ci'.*(xi-x0));
end

