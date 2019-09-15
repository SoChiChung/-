function [fvals,varmins] = varmin()
%VARMIN �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
global data;
data=getData();
C=0.003;

I0=0.0525;

Xi0=zeros(9,1);
Xi0(5)=1;
lb=zeros(9,1);
ub=zeros(9,1)+1;

%�����Բ���Լ��ϵ��A
A=zeros(1,9);
[row,~]=size(data.r);
for i=1:row
    A(i)=E(data.r(i,:))+amc(data.asset(i,:));
end
A=(-1).*A;


%���������Լ��ϵ��Aeq
Aeq=zeros(1,9)+1;
beq=1;
 %��������� ȡֵ 1-2
% r0s=1:0.1:2;
% [~,col]=size(r0s);
% global r0;
% varmins=zeros(1,9);
% fvals=zeros(11,9);
% for i=1:col
%     r0=r0s(i);
%     [Xfval,varmin] =fmincon('VarLowRp',Xi0,[],[],[],[],lb,ub,@fcontr2);
%     varmins(i)=varmin;
%     disp('��'+i+'��:')
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
%TESTLOG ����X*lnX��ֵ ��X=0��ʱ ����0

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
%���յ�Լ������
%X Ͷ�ʱ���

global data;
[row,~]=size(data.asset);
global r0

%Ͷ�����������������ʲ�����Ϊm
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