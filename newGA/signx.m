function [x] = signx(x,m)
%处理x 使得sign(x)<=m成立
%   此处显示详细说明
sorted =sort(x,2);%行排列X
[row,col]=size(x);
Max_mth=sorted(:,col-m+1);%取第m大的数
;
for i=1:row
    x(i,x(i,:)<Max_mth(i))=0;
    
end

end

