function [result] = p1(x)
%惩罚函数p1  
%针对不满足约束条件 sum(X*lnX)>=e p1(x)=max(0,e+sum(X*lnX))
[row,~]=size(x);

for i=1:row
    result(row,:)=max(sum(testlog(x(row,:)))+exp(1),0);
end
end

function [res] = testlog(X)
%TESTLOG 计算X*lnX的值 当X=0的时 返回0

    if(X==0)
        res=0;
    else 
        res=X.*log(X);
    end

end

