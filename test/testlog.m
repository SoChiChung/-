
function [res] = testlog(X)
%TESTLOG 计算X*lnX的值 当X=0的时 返回0


    if(X==0)
        res=0;
    else 
        res=X.*log(X);
    end

end

