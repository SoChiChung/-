function [res] = test(x)
%TEST �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵
[row,~]=size(x);
i=1:1:row;
res(i,:)=find_max_num(x(i,:),4);
end
function y=find_max_num(A,num)
A=unique(A);
A=fliplr(A);
l=length(A);
if num<=l
 y=A(num);
end 
end

