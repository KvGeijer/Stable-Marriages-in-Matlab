filePath = fullfile("data","secret","5testhugemessy.in");
fileId = fopen(filePath,'r');
%fileId = 0;
text = fscanf(fileId,'%d');

n = text(1);

men = zeros(n,n+1);
women = zeros(n,n+1);

% Setup matrices
for personNum = 1:2*n
    personInd = (personNum-1)*(n+1) + 2;
    person = text(personInd);
    if (women(person,1) == 0)      %It's a woman
        for manInd = 1:n
           man = text(personInd+manInd);
           women(person,man) = manInd;  
        end
    else                             %It's a man
        men(person,n+1) = 1;
        for womanInd = 1:n
           men(person,womanInd) = text(personInd+womanInd); 
        end
    end
end

menQ = Stack();
for man = 1:n
    menQ = menQ.push(man);
end

man = 0;
woman = 0;
prefWomanIndex = 0;
otherMan = 0;

while(menQ.hasNext())
    [menQ, man] = menQ.pop();
    woman = men(man,men(man,n+1));
    men(man,n+1) = men(man,n+1) + 1;
    
    if (women(woman,n+1)==0)        %She is single
        women(woman,n+1) = man;
    elseif ( women(woman,man)<women(woman,women(woman,n+1)) )    %She wants to switch
        menQ = menQ.push(women(woman,n+1));
        women(woman,n+1) = man;
    else                                                        %She wants to stay
        menQ = menQ.push(man);
    end
end

for woman = 1:n
    fprintf('%d\n',women(woman,n+1));
end


