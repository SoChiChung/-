function [x] = main()
%UNTITLED �˴���ʾ�йش˺�����ժҪ

%Step1:����w1y�ļ�ֵ

% %��ʾԼ�� Axi<b
% A=ones(1,12);


% b=[0;1];

Xi0=zeros(1,12)';
Xi0(1)=1;
% �²���ܵĽ����Ϊ���
%��E �������
[~,Emin] = fmincon(@ERn,Xi0,[],[],[],[],[],[],@fcontr);
[~,Emax] = fmaxcon(@ERn,Xi0,[],[],[],[],[],[],@fcontr);
%��w1���ұߵļ�ֵ
fun1=@(xi)(ERn(xi)-Emin)/(Emax-Emin);
[~,ymin1] = fmincon(fun1,Xi0,[],[],[],[],[],[],@fcontr);

% %Step2:����w2y�ļ�ֵ
% 
% %��var �������
% [~,varmin] = fmincon(@VarLowRp,Xi0,[],[],[],[],[],[],@fcontr);
% [~,varmax] = fmaxcon(@VarLowRp,Xi0,[],[],[],[],[],[],@fcontr);
% %��w2���ұߵļ�ֵ
% fun2=@(xi)(VarLowRp(xi)-varmin)/(varmax-varmin);
% [~,ymin2] = fmincon(fun2,Xi0,[],[],[],[],[],[],@fcontr);
% 
% %Step3:����w3y�ļ�ֵ
% %��skw �������
% [~,skwmin] = fmincon(@SkwRp,Xi0,[],[],[],[],[],[],@fcontr);
% [~,skwmax] = fmaxcon(@SkwRp,Xi0,[],[],[],[],[],[],@fcontr);
% %��w3���ұߵļ�ֵ
% fun3=@(xi)(skw(xi)-skwmin)/(skwmax-skwmin);
% [~,ymin3] = fmincon(fun3,Xi0,[],[],[],[],[],[],@fcontr);
% 
% %��Amb �������
% [~,Ambmin] = fmincon(@AmbRp,Xi0,[],[],[],[],[],[],@fcontr);
% [~,Ambmax] = fmaxcon(@AmbRp,Xi0,[],[],[],[],[],[],@fcontr);
% 
% %��w4���ұߵļ�ֵ
% fun4=@(xi)(AmbRp(xi)-Ambmin)/(Ambmax-Ambmin);
% [~,ymin4] = fmincon(fun4,Xi0,[],[],[],[],[],[],@fcontr);
% 
% %��F �������
% [~,Fmin] = fmincon(@Frp,Xi0,[],[],[],[],[],[],@fcontr);
% [~,Fmax] = fmaxcon(@Frp,Xi0,[],[],[],[],[],[],@fcontr);
% 
% %��w5���ұߵļ�ֵ
% fun5=@(xi)(Frp(xi)-Fmin)/(Fmax-Fmin);
% [~,ymin5] = fmincon(fun5,Xi0,[],[],[],[],[],[],@fcontr);

end



function [a,b,c,d]=fcontr(X)
%Լ������
%X 12��Ͷ�ʱ���
m=12;%Ͷ�����������������ʲ�����Ϊm

a=sum(X)-1;
b=sum(X.*log(X))-exp(1);
c=sum(sign(X))-m;
[row,~]=size(asset);
for i=1:row
    res(i,:)=amc(asset(i,:));
end
d=l0-sum(X.*res);
end


% function b=restrain2(X)
% %Լ������2
% [~,col]=size(X);
% b=0;
% for i=1:col
%     b=b+X(1,col)*log(X(1,col));
% end
% end


