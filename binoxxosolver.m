function y = binoxxosolver()
%% Binoxxo-Solver
% Regeln:
% 1. Es dürfen nie mehr als zwei aufeinanderfolgende X oder O in einer
% Zelle oder Spalte vorkommen
% 2. In jeder Zeile und jeder Spalte stehen gleich viele X und O
% 3. Alle Zeilen und alle Spalten sind einzigartig

% Input (0=Kreis, 1=X, 2=leer)
% I = [2,2,2,2,2,2;...
%     1,2,2,2,2,1;...
%     2,2,2,1,2,2;...
%     0,2,2,1,2,2;...
%     2,0,2,2,2,2;...
%     2,0,2,2,1,2]

% I = [0,1,1,0,0,1;...
%     1,0,1,0,0,1;...
%     0,1,0,1,1,0;...
%     0,1,0,1,0,1;...
%     1,0,1,0,1,0;...
%     1,0,0,1,1,0];

I = [0,0,1,0,1,1;...
    0,1,0,0,1,1;...
    0,1,0,1,0,1;...
    0,0,1,0,1,1;...
    1,0,0,1,1,0;...
    1,0,1,1,0,0];

ruleOne(I)

ruleTwo(I)

ruleTree(I)

end

function x = ruleOne(I)

S = size(I);
zeilen = S(1,1);
spalten = S(1,2);

flag = 0;
for z = 1:zeilen
counter_0 = 0;
counter_x = 0;
    for s = 1:spalten
        if(I(z,s)==0 && counter_0 <= 2)
            counter_0 = counter_0+1;
            counter_x = 0;
        elseif(I(z,s)==1 && counter_x <= 2)
            counter_x = counter_x+1;
            counter_0 = 0;
        elseif(I(z,s)==2)
            counter_x = 0;
            counter_0 = 0;
        end
        if(counter_x == 3 || counter_0 == 3)
            flag = 1;
        end 
    end
end
x = flag;
end

function x = ruleTwo(I)

S = size(I);
zeilen = S(1,1);
spalten = S(1,2);

flag = 0;

for n = 1:zeilen
    if(((sum(I(n,:)==0)) ~= (spalten/2)) || ((sum(I(n,:)==1)) ~= (spalten/2)))
        flag = 1;
    end
end
x = flag;
end

function x = ruleTree(I)

S = size(I);
zeilen = S(1,1);

flag = 0;

for n = 1:zeilen
    aktzeile = I(n,:);
    for m = n+1:zeilen
        if isequal(aktzeile,I(m,:))
            flag = 1;
        end
    end
end
x = flag;
end