function [x] = main()
%UNTITLED �˴���ʾ�йش˺�����ժҪ

%Step1:����w1y�ļ�ֵ

%��ʾԼ�� Axi<b
A=ones(1,12);
b=[0;1];
Xi0=ones(1,12)./2;% �²���ܵĽ����Ϊ���
[xi,Emin] = fmincon(@ERn,Xi0,A,b);
[xi,Emax] = fmaxcon(@ERn,Xi0,A,b);

%Step2:����w2y�ļ�ֵ


end


