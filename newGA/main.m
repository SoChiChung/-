function [bestins,E_max,Var_min] = main()
%MAIN 多次循环递归函数
% bestins 每次最优解的集合 E_max 对应的期望值
tic;
r0=1:0.05:1.5;%
[~,col]=size(r0);
E_max=zeros(col,1);
Var_min=zeros(col,1);
bestins=zeros(col,9);
for i=1:col
    fprintf(1,'正在进行r0为 %f 的求解 请稍等......\n',r0(i));
    start=tic;
    [bestin]=mode(r0(i));
    E_max(i,:)=E(bestin);
    Var_min(i,:)=VarLowRp2(bestin);
    bestins(i,:)=bestin;
    fprintf(1,'r0为 %f 的投资比例为：\n',r0(i));
    fprintf(1,'%.4f  %.4f  %.4f  %.4f \n',bestin);
    END=toc(start);
    fprintf(1,'本次用时 %f \n',END);
end

scatter(Var_min,E_max)
fprintf(1,'time:%f\n',toc);
end

