function VarLowRp=VarLowRp2(xi)
%�ʲ���ϵ�ʵ����������¿����԰뷽��
%xi ����
global data;
data=getData();
r=data.r;
tao=data.tao;
RP=xi*r-tao;
VarLowRp=VarLow(RP);

end

function VarLow =VarLow(X)
%�¿����԰뷽��
% XΪģ���� ��a,b,alpha,beta��
VarLow=(((X(:,2)-X(:,1))/2+(X(:,3)+X(:,4))/6).^2+X(:,3).^2/18);
end

