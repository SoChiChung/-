
function [res] = testlog(X)
%TESTLOG ����X*lnX��ֵ ��X=0��ʱ ����0


    if(X==0)
        res=0;
    else 
        res=X.*log(X);
    end

end

