function [res]=untitled2(a,b)
%UNTITLED2 此处显示有关此函数的摘要
%   此处显示详细说明
[row,~]=size(a);
for i=1:row
    res(i,:)=a(i,:).*b;
end

end

