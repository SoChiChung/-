function [bestins,E_max] = main()
%MAIN 多次循环递归函数
%   此处显示详细说明
l0=1:0.1:2;
tic;
for i=1:11
    start=tic;
    [bestin]=mode(l0);
    E_max(i,:)=E(bestin);
    bestins(i,:)=bestin;
    fprintf(1,'i为%d 的投资比例为：\n',i);
    fprintf(1,'%.4f  %.4f  %.4f  %.4f\n',bestin);
END=toc(start);
    fprintf(1,'本次用时 %f \n',END);
end

plot(l0,E_max);
fprintf(1,'time:%f\n',toc);
end

