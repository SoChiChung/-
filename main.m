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
fun1=@(xi)(ERn(xi)-Emin)/(Emax-Emin);
[~,ymin1] = fmincon(fun1,Xi0,[],[],[],[],[],[],@fcontr);


%Step3:����w3y�ļ�ֵ

%��skw �������
[~,skwmin] = fmincon(@skw,Xi0,[],[],[],[],[],[],@fcontr);
[~,skwmax] = fmaxcon(@skw,Xi0,[],[],[],[],[],[],@fcontr);
%��w3���ұߵļ�ֵ
fun3=@(xi)(skw(xi)-skwmin)/(skwmax-skwmin);
[~,ymin1] = fmincon(fun3,Xi0,[],[],[],[],[],[],@fcontr);
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


