function [result] = p1(x)
%�ͷ�����p1  
%��Բ�����Լ������ sum(X*lnX)>=e p1(x)=max(0,e+sum(X*lnX))
[row,~]=size(x);

for i=1:row
    result(row,:)=max(sum(testlog(x(row,:)))+exp(1),0);
end
end

function [res] = testlog(X)
%TESTLOG ����X*lnX��ֵ ��X=0��ʱ ����0

    if(X==0)
        res=0;
    else 
        res=X.*log(X);
    end

end

