function c = c(ci,xi,x0)
%���׷���
% ci ���׷��ñ���
% x0 ԭͶ�ʱ���
% xi ��Ͷ�ʱ���
[row,~]=size(ci);
c=0;
for i=1:row
    c=c+ci(row)*abs(xi(i)-x0(i));
end
end

