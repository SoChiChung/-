function [nbestfit,nbestin] = elite(newpop,obj,bestfit,bestin)
best1 = max(obj);
if best1 > bestfit
    nbestfit = best1;
    k = find(obj == best1);
    nbestin = newpop(k(1),:);
else
    nbestfit = bestfit;
    nbestin = bestin;
end
    
