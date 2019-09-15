function VarLowRp=VarLowRp(xi)
%资产组合的实际总收益的下可能性半方差
%xi 比例
global data;
data=getData();
r=data.r;
tao=data.tao;
var11=var1(xi);var3=0;
var2=VarLow(tao);
[row,~]=size(r);


for i=1:row
    var3=xi(i)*cov(r(i,:),tao);
end
var3=var3*2;
VarLowRp=var11-var2+var3;
end

function VarLow =VarLow(X)
%下可能性半方差
% X为模糊数 【a,b,alpha,beta】
a=X(1);
b=X(2);
alpha=X(3);
beta=X(4);

VarLow=(((b-a)/2+(alpha+beta)/6)^2+alpha^2/18);
end

function cov=cov(ar,at)
rA=ar(1);
rB=ar(2);
rAlpha=ar(3);
rBeta=ar(4);

tA=at(1);
tB=at(2);
tAlpha=at(3);
tBeta=at(4);

cov=(rB-rA)*(tB-tA)/4+((rB-rA)*(tAlpha+tBeta)+(tB-tA)*(rAlpha+rBeta))/12+((rA+rB)*(tAlpha+tBeta)+2*rAlpha+rBeta)/36;
end

function [var1]=var1(xi)
[row,col]=size(xi);
global data;
data=getData();
for i=1:col
    var1_1(i,:)=xi(i)^2.*VarLow(data.r(i,:));
end
var1_1=sum(var1_1);
var1_2=0;
for j=1:col
    var1_2_cov=0;
    if(j~=col)
        for k=j+1:col
           var1_2_cov= var1_2_cov +(xi(j)*xi(k)).*cov(data.r(j,:),data.r(k,:));
        end
    end
var1_2=var1_2+var1_2_cov;
end
var1=var1_1+2*var1_2;
end

