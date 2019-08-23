function [x] = main()
%UNTITLED 此处显示有关此函数的摘要

%Step1:计算w1y的极值

% %表示约束 Axi<b
% A=ones(1,12);


% b=[0;1];

Xi0=zeros(1,12)';
Xi0(1)=1;
% 猜测可能的结果作为起点
%求E 的理想解
[~,Emin] = fmincon(@ERn,Xi0,[],[],[],[],[],[],@fcontr);
[~,Emax] = fmaxcon(@ERn,Xi0,[],[],[],[],[],[],@fcontr);
%求w1的右边的极值
fun1=@(xi)(ERn(xi)-Emin)/(Emax-Emin);
[~,ymin1] = fmincon(fun1,Xi0,[],[],[],[],[],[],@fcontr);

% %Step2:计算w2y的极值
% 
% %求var 的理想解
% [~,varmin] = fmincon(@VarLowRp,Xi0,[],[],[],[],[],[],@fcontr);
% [~,varmax] = fmaxcon(@VarLowRp,Xi0,[],[],[],[],[],[],@fcontr);
% %求w2的右边的极值
% fun2=@(xi)(VarLowRp(xi)-varmin)/(varmax-varmin);
% [~,ymin2] = fmincon(fun2,Xi0,[],[],[],[],[],[],@fcontr);
% 
% %Step3:计算w3y的极值
% %求skw 的理想解
% [~,skwmin] = fmincon(@SkwRp,Xi0,[],[],[],[],[],[],@fcontr);
% [~,skwmax] = fmaxcon(@SkwRp,Xi0,[],[],[],[],[],[],@fcontr);
% %求w3的右边的极值
% fun3=@(xi)(skw(xi)-skwmin)/(skwmax-skwmin);
% [~,ymin3] = fmincon(fun3,Xi0,[],[],[],[],[],[],@fcontr);
% 
% %求Amb 的理想解
% [~,Ambmin] = fmincon(@AmbRp,Xi0,[],[],[],[],[],[],@fcontr);
% [~,Ambmax] = fmaxcon(@AmbRp,Xi0,[],[],[],[],[],[],@fcontr);
% 
% %求w4的右边的极值
% fun4=@(xi)(AmbRp(xi)-Ambmin)/(Ambmax-Ambmin);
% [~,ymin4] = fmincon(fun4,Xi0,[],[],[],[],[],[],@fcontr);
% 
% %求F 的理想解
% [~,Fmin] = fmincon(@Frp,Xi0,[],[],[],[],[],[],@fcontr);
% [~,Fmax] = fmaxcon(@Frp,Xi0,[],[],[],[],[],[],@fcontr);
% 
% %求w5的右边的极值
% fun5=@(xi)(Frp(xi)-Fmin)/(Fmax-Fmin);
% [~,ymin5] = fmincon(fun5,Xi0,[],[],[],[],[],[],@fcontr);

end



function [a,b,c,d]=fcontr(X)
%约束条件
%X 12个投资比例
m=12;%投资者所允许持有最大资产种数为m

a=sum(X)-1;
b=sum(X.*log(X))-exp(1);
c=sum(sign(X))-m;
[row,~]=size(asset);
for i=1:row
    res(i,:)=amc(asset(i,:));
end
d=l0-sum(X.*res);
end


% function b=restrain2(X)
% %约束条件2
% [~,col]=size(X);
% b=0;
% for i=1:col
%     b=b+X(1,col)*log(X(1,col));
% end
% end


