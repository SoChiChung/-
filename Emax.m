function [] = Emax()
%获取maxE 收益期望值最大值
%Xi ： 资产组合的投资比例
%data asset 股票的模糊数
global data;
data=getData();

Xi0=zeros(9,1);
Xi0(5)=1;
lb=zeros(9,1);
ub=zeros(9,1)+1;
global var0s;
% 猜测可能的结果作为起点 
%Xi0 表示Xi的起始值[1,...0]


%求线性不等约束系数A
A=zeros(1,9);
[row,~]=size(data.r);
for i=1:row
    A(i)=E(data.r(i,:))+amc(data.asset(i,:));
end
A=[(-1).*A;zeros(1,9)+1];
b=[E(data.tao)+]
%求w1的右边的极值

[Xfval,Emax] =fmincon(@ERn,Xi0,[],[],[],[],lb,ub,@fcontr1);
Emax=Emax*(-1);


%把Emax的值传给全局变量 max 方便求风险

Emax
Xfval
end

function [res] = testlog(X)
%TESTLOG 计算X*lnX的值 当X=0的时 返回0

[~,col]=size(X);
res=zeros(col,1);
for i=1:col
    if(X(i)==0)
        res(i,:)=0;
    else 
        res(i,:)=X(i)*log(X(i));
    end
end
end

function [c,ceq]=fcontr1(X)
%收益的约束条件
%X 投资比例
global data;
[row,~]=size(data.asset);
%投资者所允许持有最大资产种数为m
m=6;
l0=1;
global var0;
var0=0;

f1=VarLowRp(X)-var0;
f2=sum(X)-1;

f3=exp(1)+sum(testlog(X));
f4=sum(sign(X))-m;

for i=1:row
    res(i,:)=amc(data.asset(i,:));
end
f5=l0-sum(X.*res);

c=[f1;f3;f4;f5];
ceq=[f1;f2;f3;f4;f5];
end





