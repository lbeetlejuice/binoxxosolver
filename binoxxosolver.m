function binoxxosolver()
%% Binoxxo-Solver
% Rules:
% 1. There must never be more than two consecutive X or O in a rows or column.
% 2. Each rows and each column contains the same number of X and O.
% 3. All rowss and columns are unique.
% 
% The number of rowss and columns must be even.

% Input (0=circle, 1=X, 2=empty)
% I = [2,2,2,2,2,2;...
%     1,2,2,2,2,1;...
%     2,2,2,1,2,2;...
%     0,2,2,1,2,2;...
%     2,0,2,2,2,2;...
%     2,0,2,2,1,2];

% Solution
% I = [0,1,1,0,0,1;...
%     1,0,1,0,0,1;...
%     0,1,0,1,1,0;...
%     0,1,0,1,0,1;...
%     1,0,1,0,1,0;...
%     1,0,0,1,1,0];

% Testmatrix
I = [2,2,2,2,2,2;...
    1,2,2,2,2,1;...
    2,2,2,1,2,2;...
    0,2,2,1,2,2;...
    2,0,2,2,2,2;...
    2,0,2,2,1,2];

S = size(I);
rows = S(1,1);
columns = S(1,2);
I_res = zeros(rows,columns);

flag = 0;
counter = 0;
while counter == 3
    
    for n = 1:rows
        for m = 1:columns
            if(I(n,m)==2)
                r = randi(2)-1;
                I_res(n,m)=r;
            end
        end
    end
    counter = counter + 1;
%     if((ruleOne(I_res)==0)&&(ruleOne(I_res')==0)&&(ruleTwo(I_res)==0)&&...
%         (ruleTwo(I_res')==0)&&(ruleTree(I_res)==0)&&(ruleTree(I_res')==0))
%         flag = 1;
%     end

end
I_res

% ruleOne(I)
% ruleOne(I')
% 
% ruleTwo(I)
% ruleTwo(I')
% 
% ruleTree(I)
% ruleTree(I')



end

function x = ruleOne(I)
% 1. There must never be more than two consecutive X or O in a cell or column.
S = size(I);
rows = S(1,1);
columns = S(1,2);

flag = 0;
for n = 1:rows
counter_0 = 0;
counter_x = 0;
    for m = 1:columns
        if(I(n,m)==0 && counter_0 <= 2)
            counter_0 = counter_0+1;
            counter_x = 0;
        elseif(I(n,m)==1 && counter_x <= 2)
            counter_x = counter_x+1;
            counter_0 = 0;
        elseif(I(n,m)==2)
            counter_x = 0;
            counter_0 = 0;
        end
        if(counter_x == 3 || counter_0 == 3)
            flag = 1;
        end 
    end
end
x = flag;
% Output: 0 = ok, 1 = error
end

function x = ruleTwo(I)
% 2. Each rows and each column contains the same number of X and O.
S = size(I);
rows = S(1,1);
columns = S(1,2);
flag = 0;
for n = 1:rows
    if(((sum(I(n,:)==0)) > (columns/2)) || ((sum(I(n,:)==1)) > (columns/2)))
        flag = 1;
    end
end
x = flag;
% Output: 0 = ok, 1 = error
end

function x = ruleTree(I)
% 3. All rowss and columns are unique.
S = size(I);
rows = S(1,1);
flag = 0;
for n = 1:rows
    aktzeile = I(n,:);
    for m = n+1:rows
        if isequal(aktzeile,I(m,:))
            flag = 1;
        end
    end
end
x = flag;
% Output: 0 = ok, 1 = error
end