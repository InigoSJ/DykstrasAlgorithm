%M = matrix to aproximate following a given pattern
%P = matrix of matrices in which each matrix is a symmetric matrix 
% representing the pattern

function [MF]=ConditionPattern(M,P)
    %format long


    n=length(M(1,:));
    p=length(P(1,1,:));
    alpha=zeros(n,n); %escalar
    MF=zeros(n,n); % matrix sum
    for i=1:p % number of symmetric matrices
            sumNUM=0;
            sumDEN=0;
            for k=1:n
                for l=1:n
                    sumNUM=sumNUM+M(k,l)*P(k,l,i);
                    sumDEN=sumDEN+P(k,l,i);
                end
            end
            alpha(i)=sumNUM/sumDEN;
            MF=MF+alpha(i).*P(:,:,i);
        end
end

        
        