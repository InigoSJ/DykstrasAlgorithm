
% A = matrix to aproximate

% L & U = Lower and Upper bound matrix. Comparison element to element
% P = matrix of matrices in which each matrix is a symmetric matrix 
% representing the pattern
% eps = epsilon
% TOL = tolerance adited
% max = maximum iterations allowed
function [X] = DykstraTOL(A,L,U,P,eps,TOL,max)

    addpath('Conditions')
    tic
    format long
    n=length(A(1,:));
    % not E dependant
    Av(:,:,1)=A; %A0
    Av(:,:,2)=ConditionLU(A,L,U);
    Av(:,:,3)=ConditionPattern(Av(:,:,2),P);
    Av(:,:,4)=ConditionPositiveDef(Av(:,:,3),eps); %A3

    zero=zeros(n,n);
    Ev(:,:,1)=zero; %E -2
    Ev(:,:,2)=zero;
    Ev(:,:,3)=zero; %E 0
    i=1;
    tol0=999; % guarantee it goes through the loop
    while i<max && tol0>TOL
        %ConditionLU
        Ev(:,:,4)=Av(:,:,1)+Ev(:,:,1)-Av(:,:,2);
        Av(:,:,5)=ConditionLU(Av(:,:,4)+Ev(:,:,4),L,U);
        %ConditionPattern
        Ev(:,:,5)=Av(:,:,2)+Ev(:,:,2)-Av(:,:,3);
        Av(:,:,6)=ConditionPattern(Av(:,:,5)+Ev(:,:,5),P); 
        %ConditionPositiveDef
        Ev(:,:,6)=Av(:,:,3)+Ev(:,:,3)-Av(:,:,4);
        Av(:,:,7)=ConditionPositiveDef(Av(:,:,6)+Ev(:,:,6),eps);
        tol0=norm(Av(:,:,7)-Av(:,:,4),'fro');

        %next iteration
        Av(:,:,1)=Av(:,:,4);
        Av(:,:,2)=Av(:,:,5);
        Av(:,:,3)=Av(:,:,6);
        Av(:,:,4)=Av(:,:,7);
        Ev(:,:,1)=Ev(:,:,4);
        Ev(:,:,2)=Ev(:,:,5);
        Ev(:,:,3)=Ev(:,:,6);
        i=i+1;

    end
    X=Av(:,:,7);
    i+2
    tol0
    toc
end