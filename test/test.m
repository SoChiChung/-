function [max] = test()
%TEST 此处显示有关此函数的摘要
%   此处显示详细说明
x=zeros(2,1);
A=[];
b=[];
Aeq=[];
beq=[];
vlb=[0,0];
vub=[];


[~,max] = fmaxcon(untitled,x,A,b,Aeq,beq,vlb,vub,'mycon');
end
function [g,ceq]=mycon(x)
g=-x(1)^2+x(2);
ceq=-x(1)-x(2)^2+2;
end






