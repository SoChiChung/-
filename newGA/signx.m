function [x] = signx(x,m)
%����x ʹ��sign(x)<=m����
%   �˴���ʾ��ϸ˵��
sorted =sort(x,2);%������X
[row,col]=size(x);
Max_mth=sorted(:,col-m+1);%ȡ��m�����
;
for i=1:row
    x(i,x(i,:)<Max_mth(i))=0;
    
end

end

