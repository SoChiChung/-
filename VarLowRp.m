function VarLowRp=VarLowRp(x,xi,r,tao)
%�ʲ���ϵ�ʵ����������¿����԰뷽��
%xi ����
var1=0;var3=0;
var2=VarLow(tao);
[~,col]=size(r);
r=r-tao;

for i=1:col
    var1=var1+xi(i)^2.*VarLow(x(i));
    var3=xi*cov(r(i),t(i));
end
var3=var3*2;
VarLowRp=var1-var2+var3;
end

function VarLow =VarLow(X)
%�¿����԰뷽��
% XΪģ���� ��a,b,alpha,beta��
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

cov=(rB-Ra)*(tB-tA)/4+((rB-Ra)*(tAlpha+tBeta)+(tB-tA)*(rAlpha+rBeta))/12+((rA+rB)*(tAlpha+tBeta)+2*rAlpha+rBeta)/36;
end

