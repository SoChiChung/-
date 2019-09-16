function [p3] = p3_Emax(x,var0)
%求收益期望值的惩罚函数p3
% 

[row,~]=size(x);
for i=1:row
    p3(row,:)=max(VarLowRp(x(row,:))-var0,0);
end
end

