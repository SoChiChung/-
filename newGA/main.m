function [bestins,E_max,Var_min] = main()
%MAIN ���ѭ���ݹ麯��
% bestins ÿ�����Ž�ļ��� E_max ��Ӧ������ֵ
tic;
r0=1:0.05:1.5;%
[~,col]=size(r0);
E_max=zeros(col,1);
Var_min=zeros(col,1);
bestins=zeros(col,9);
for i=1:col
    fprintf(1,'���ڽ���r0Ϊ %f ����� ���Ե�......\n',r0(i));
    start=tic;
    [bestin]=mode(r0(i));
    E_max(i,:)=E(bestin);
    Var_min(i,:)=VarLowRp2(bestin);
    bestins(i,:)=bestin;
    fprintf(1,'r0Ϊ %f ��Ͷ�ʱ���Ϊ��\n',r0(i));
    fprintf(1,'%.4f  %.4f  %.4f  %.4f \n',bestin);
    END=toc(start);
    fprintf(1,'������ʱ %f \n',END);
end

scatter(Var_min,E_max)
fprintf(1,'time:%f\n',toc);
end

