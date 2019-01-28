function [A,L,U,P]=DataExperiment2(n)
    L=zeros(n);
    A=zeros(n);
    U=zeros(n);
    P=PToeplitz(n);
    for i=1:n
        for j=1:n
            A(i,j)=i-j+(i/(i+j-1));
            U(i,j)=i+j;
         end
    end
end