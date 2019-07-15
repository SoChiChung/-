function Amp=Amp(x,xi,tao)
%资产组合不确定性
t=getM(tao);
[row,~]=size(x);
Amp=0;
for i=1:row
    m=getM(x(i,:));
    a=m(1);
b=m(2);
alpha=m(3);
beta=m(4);
Amp=Amp+xi(i)*((b-a)/2+(alpha+beta)/6);

end
Amp=Amp-((t(2)-t(1))/2+(t(3)+t(4))/6);

end

