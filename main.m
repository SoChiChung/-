function [x] = main()
%UNTITLED �˴���ʾ�йش˺�����ժҪ

%Step1:����w1y�ļ�ֵ

% %��ʾԼ�� Axi<b
% A=ones(1,12);
% b=[0;1];

Xi0=ones(1,12);
Xi0(1)=1;
% �²���ܵĽ����Ϊ���
%��E �������
[~,Emin] = fmincon(@ERn,Xi0,[],[],[],[],[],[],@fcontr);
[~,Emax] = fmaxcon(@ERn,Xi0,[],[],[],[],[],[],@fcontr);
%��w1���ұߵļ�ֵ
fun=@(xi)(ERn(xi)-Emin)/(Emax-Emin);
[~,ymin1] = fmincon(fun,Xi0,[],[],[],[],[],[],@fcontr);

%Step2:����w2y�ļ�ֵ


end
function [a,b,c]=fcontr(X)
%Լ������
%X 12��Ͷ�ʱ���
m=12;%Ͷ�����������������ʲ�����Ϊm

a=sum(X)-1;
b=sum(X.*log(X))-exp(1);
c=sum(sign(X))-m;

end


% function b=restrain2(X)
% %Լ������2
% [~,col]=size(X);
% b=0;
% for i=1:col
%     b=b+X(1,col)*log(X(1,col));
% end
% end


