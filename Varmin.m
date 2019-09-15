function [fvals,varmins] = varmin()
%VARMIN 此处显示有关此函数的摘要
%   此处显示详细说明
global data;
data=getData();
C=0.003;

I0=0.0525;

Xi0=zeros(9,1);
Xi0(5)=1;
lb=zeros(9,1);
ub=zeros(9,1)+1;

%求线性不等约束系数A
A=zeros(1,9);
[row,~]=size(data.r);
for i=1:row
    A(i)=E(data.r(i,:))+amc(data.asset(i,:));
end
A=(-1).*A;


%求线性相等约束系数Aeq
Aeq=zeros(1,9)+1;
beq=1;
 %最低收益率 取值 1-2
% r0s=1:0.1:2;
% [~,col]=size(r0s);
% global r0;
% varmins=zeros(1,9);
% fvals=zeros(11,9);
% for i=1:col
%     r0=r0s(i);
%     [Xfval,varmin] =fmincon('VarLowRp',Xi0,[],[],[],[],lb,ub,@fcontr2);
%     varmins(i)=varmin;
%     disp('第'+i+'代:')
%     disp('Xfval:')
%     disp(Xfval)
%     fvals(i,:)=Xfval';
% end

% plot(varmins,r0s)
% r0s
options=optimoptions(@fmincon,'MaxFunEvals',5000);
r0s=1:0.1:2;
for i=1:10
    b=(-1)*(E(data.tao)+C+I0+r0s(i));
[Xfval,varmin] =fmincon('VarLowRp',Xi0,A,b,Aeq,beq,lb,ub,@fcontr2,options);
fvals(i,:)=Xfval;
varmins(i,:)=varmin;
end
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
function [c,ceq]=fcontr2(X)
%风险的约束条件
%X 投资比例

global data;
[row,~]=size(data.asset);
global r0

%投资者所允许持有最大资产种数为m
m=6;
l0=0.0525;
f1=r0-ERn(X);
f2=sum(X)-1;

f3=exp(1)+sum(testlog(X));

f4=sum(sign(X))-m;
for i=1:row
    res(i,:)=amc(data.l(i,:));
end
f5=l0-sum(X.*res);

c=[f3;f4];
ceq=0;
end