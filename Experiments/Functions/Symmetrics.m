function [P]=Symmetrics(n)
    P(:,:,1)=zeros(n,n);
    k=1;
    for i=1:n
       for j=i:n
          P(i,j,k)=1;
          P(j,i,k)=1;
          k=k+1;
       end
    end
end