% M = matrix to aproximate with the positive definite with eigenvalues
% greater than a given epsilon condition
% eps = epsilon
function [MF]=ConditionPositiveDef(M,eps)
    %format long

    B=(M+M')/2;
    C=(M-M')/2;
    [Z,AV]=eig(B); % spectral decomposition B=Z*av(B)*Z'
    nav=length(AV);
    diag=zeros(nav,nav);
    for i=1:nav
        if AV(i,i)<eps
            diag(i,i)=eps;
        else
            diag(i,i)=AV(i,i);
        end
    end
    MF=Z*diag*Z';
end