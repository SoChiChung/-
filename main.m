function [x] = main()
%UNTITLED 此处显示有关此函数的摘要

%Step1:计算w1y的极值

%表示约束 Axi<b
A=ones(1,12);
b=[0;1];
Xi0=ones(1,12)./2;% 猜测可能的结果作为起点
[xi,Emin] = fmincon(@ERn,Xi0,A,b);
[xi,Emax] = fmaxcon(@ERn,Xi0,A,b);

%Step2:计算w2y的极值


end


