function pop_cross=crossover(pop,popsize,pc)
%crossover operation

pop_cross = [];
for i = 1:popsize
    j = [1:i-1,i+1:popsize];
    for u = 1:popsize-1
        if rand < pc
        a = rand;
        npop = a*pop(i,:)+(1-a)*pop(j(u),:);
        pop_cross = [pop_cross;npop];
        end
    end
end


        