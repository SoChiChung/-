function [p3] = p3_Emax(x,var0)
%����������ֵ�ĳͷ�����p3
% 

[row,~]=size(x);
for i=1:row
    p3(row,:)=max(VarLowRp(x(row,:))-var0,0);
end
end

