function newpop = selection(obj,pop,popsize)
%selection operation

%deviding the roulette
fitp=obj/sum(obj);
roul=cumsum(fitp); 

%turnning the pointer
ma=rand(1,popsize); 

%selecting the indicidual
for i=1:popsize
    fitin=1;
    while ma(i)>roul(fitin)
        fitin=fitin+1;
    end
    newpop(i,:)=pop(fitin,:);
end