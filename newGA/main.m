function [bestins,E_max] = main()
%MAIN ���ѭ���ݹ麯��
%   �˴���ʾ��ϸ˵��
l0=1:0.1:2;
tic;
for i=1:11
    start=tic;
    [bestin]=mode(l0);
    E_max(i,:)=E(bestin);
    bestins(i,:)=bestin;
    fprintf(1,'iΪ%d ��Ͷ�ʱ���Ϊ��\n',i);
    fprintf(1,'%.4f  %.4f  %.4f  %.4f\n',bestin);
END=toc(start);
    fprintf(1,'������ʱ %f \n',END);
end

plot(l0,E_max);
fprintf(1,'time:%f\n',toc);
end

