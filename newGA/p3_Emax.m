function [p3] = p3_Emax(x)
%����������ֵ�ĳͷ�����p3
% 
var0=0;
[row,~]=size(x);
for i=1:row
    p3(row,:)=max(VarLowRp(x(row,:))-var0,0);
end
end

