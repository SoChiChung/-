function Frp=Frp(x,xi,tao)
%资产组合模糊性
t=getM(tao);
[~,col]=size(x);
Frp=0;
for i=1:col
    m=getM(x(i));
    Frp=Frp+xi(i)*(m(1)-m(2));
end
Frp=(Frp-(t(1)-t(2)))/4;
end

