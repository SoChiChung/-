
function [result] = p2(x)
%�ͷ�����p2  
%��Բ�����Լ������ 

% data=getData();
% [drow,~]=size(data);
% amc_data=0;
% for i=1:drow
%     amc_data(drow,:)=amc(data.assert(drow,:));
% end
 l0=0.05;
[row,~]=size(x);
result=zeros(row,1);
for i=1:row
    result(row,:)=max(l0-x(row,:),0);
end
% 
% end
% 
% function amc=amc(X)
% % XΪģ���� ��a,b,alpha,beta��
% a=X(1);
% b=X(2);
% alpha=X(3);
% beta=X(4);
% 
% amc=(b+a)/2+(beta-alpha)/6;

end

