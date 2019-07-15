
function SkwRp=SkwRp(x,xi,tao)
% x 所有的资产组合 xi x对应的投资比例 下面三个变量对应公式的三个部分
skwOne=skw1(xi,x,tao);
skwTwo=skw2(xi,x,tao);
skwThree=skw3(xi,x,tao);
SkwRp=skwOne+skwTwo+skwThree;
end


function skw1=skw1(xi,x,tao)
xAlpha=0;
xBeta=0;
t=getM(tao);
[~,col]=size(x);
for i=1:col
    m=getM(x(i));
    xAlpha=xAlpha+(xi(i)*m(3))^3;
    xBeta=xBeta+(xi(i)*m(4))^3;
end
skw1=19/45*(xBeta-xAlpha+t(3)^3-t(4)^3);
end

function skw2=skw2(xi,x,tao)
xAlpha=0;
xBeta=0;
t=getM(tao);
[~,col]=size(x);
for i=1:col
    m=getM(x(i));
    xAlpha=xAlpha+xi(i)*m(3);
    xBeta=xBeta+xi(i)*m(4);
end
skw2=(xAlpha*xBeta^2-xBeta*xAlpha^2-t(4)^2*t(3)+t(3)^2*t(4))/3;
end

function skw3=skw3(xi,x,tao)
xA=0;
xB=0;
xAlpha=0;
xBeta=0;
t=getM(tao);
[~,col]=size(x);

for i=1:col
    m=getM(x(i));
    xA=xi(i)*m(1);
    xB=xi(i)*m(2);
    xAlpha=xi(i)*m(3);
    xBeta=xi(i)*m(4);
end
skw3=(xB-xA)*(xBeta^2-xAlpha^2)-(t(2)-t(1))*(t(4)^2-t(3)^2);
end


function Skw = Skw(X)
%可能性偏度
% X为模糊数 【a,b,alpha,beta】
a=X(1);
b=X(2);
alpha=X(3);
beta=X(4);

Skw=19/1080*(beta^3-alpha^3)+(alpha*beta^2-beta*alpha^2)/72+(b-a)*(beta^2-alpha^2)/24;
end


