%利用神经网络进行函数逼近
clear all
x=0:0.1*pi:4*pi;
y=sin(x);
%设定迭代次数
net.trainparam.epochs=10000;
%网络初始化
net=newff([0,4*pi],[8,8,8,8,1],{'tansig','logsig','logsig','tansig','tansig'});
%训练网络
[net,tr,y1,e]=train(net,x,y);

X=0:0.01*pi:4*pi;
%网络泛化
y2=sim(net,X);

subplot(2,1,2);
plot(X,y2);
title('网络产生')
grid on
subplot(2,1,1);
plot(x,y,'o');
title('原始数据')
grid on