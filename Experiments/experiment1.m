A=[1,3,4,2;0,1,-1,6;7,-2,1,3;2,5,2,0.5];
L=[2,1,0,0;1,1,0,0;0,0,1,1;0,0,1,2];
U=[8,3,0,2;3,7,4,0;0,2,6,3;2,0,3,6];
P(:,:,1)=eye(4);
P(:,:,2)=[0,1,0,0;1,0,0,0;0,0,0,1;0,0,1,0];
P(:,:,3)=[0,0,0,1;0,0,1,0;0,1,0,0;1,0,0,0];