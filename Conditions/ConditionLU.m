% M = matrix to aproximate with the upper and lower bound matrix condition
% L & U = Lower and Upper bound matrix. Comparison element to element

function [MF]=ConditionLU(M,L,U)
    %format long
    n=length(M(1,:));
    MF=M;
    for i=1:n
        for j=1:n
            if M(i,j)>U(i,j)
                MF(i,j)=U(i,j);
            elseif M(i,j)<L(i,j)
                MF(i,j)=L(i,j);
            end
        end
    end
end
            