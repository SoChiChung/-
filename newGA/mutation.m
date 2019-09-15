function pop_mutation = mutation(pop,pm,popsize,cl)
% mutation operation

pop_mutation = pop;
for i = 1:popsize
    if rand < pm
        a = randperm(cl);
        pop_mutation(i,a(1)) = rand;
        pop_mutation(i,:) = pop_mutation(i,:)/sum(pop_mutation(i,:));
    end
end