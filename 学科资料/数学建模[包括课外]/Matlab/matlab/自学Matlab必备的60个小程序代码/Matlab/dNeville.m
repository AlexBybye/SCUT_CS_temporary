x1=[0 1 3];
y1=zeros(length(x1),length(x1));
y1(:,1)=[1 3 2]';
x=0:0.5:3;
Neville(x1,y1,x)