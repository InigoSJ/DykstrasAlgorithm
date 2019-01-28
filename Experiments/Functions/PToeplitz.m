function[P]=PToeplitz(n);
    P(:,:,1)=eye(n);
    v=zeros(1,n);
    for i=2:n
        u=zeros(1,n);
        u(i)=1;
    A=toeplitz(u,v);
    P(:,:,i)=A+A';
    end
end
