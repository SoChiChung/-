function [] = Emax()
%��ȡmaxE ��������ֵ���ֵ
%Xi �� �ʲ���ϵ�Ͷ�ʱ���
%data asset ��Ʊ��ģ����
global data;
data=getData();

Xi0=zeros(9,1);
Xi0(5)=1;
lb=zeros(9,1);
ub=zeros(9,1)+1;
global var0s;
% �²���ܵĽ����Ϊ��� 
%Xi0 ��ʾXi����ʼֵ[1,...0]


%�����Բ���Լ��ϵ��A
A=zeros(1,9);
[row,~]=size(data.r);
for i=1:row
    A(i)=E(data.r(i,:))+amc(data.asset(i,:));
end
A=[(-1).*A;zeros(1,9)+1];
b=[E(data.tao)+]
%��w1���ұߵļ�ֵ

[Xfval,Emax] =fmincon(@ERn,Xi0,[],[],[],[],lb,ub,@fcontr1);
Emax=Emax*(-1);


%��Emax��ֵ����ȫ�ֱ��� max ���������

Emax
Xfval
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

function [c,ceq]=fcontr1(X)
%�����Լ������
%X Ͷ�ʱ���
global data;
[row,~]=size(data.asset);
%Ͷ�����������������ʲ�����Ϊm
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





