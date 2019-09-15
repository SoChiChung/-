function [res] = test(x)
%TEST 此处显示有关此函数的摘要
%   此处显示详细说
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

