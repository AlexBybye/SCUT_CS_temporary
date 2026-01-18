%嵌入水印
clear all
a=imread('lena.tiff');           %读入原图
A=im2double(a);                  %处理矩阵,将其变为可处理的[0,1)double型
[U,S,V]=svd(A);                  %矩阵的奇异值分解 A=USV'
b=imread('baboon.tiff');         %读入水印图片
B=im2double(b);   
[m,n]=size(S);
W=zeros(m,n);                    %W记录水印
[m1,n1]=size(B);
for i=1:m1
  for j=1:n1
      W(i,j)=B(i,j);
  end
end
af=0.1;                          %嵌入强度
S1=S+af*W;                       %水印嵌入
[U1,S2,V1]=svd(S1);              %对新矩阵进行奇异值分解
C=U*S2*V';                       %得到含水印的图像
imwrite(C,'含水印.jpg','jpg');

figure(1)
imshow(A)
title('未嵌入水印图像')

figure(2)
imshow(C);
title('嵌入水印后图像');

%读水印
[UU,S3,VV]=svd(C);                       %对含有水印图像的图像进行奇异值分解
D=U1*S3*V1';                     %计算中间矩阵
E=(D-S)/af;                      %获得水印图像

figure(3)
imshow(E);
title('嵌入水印图像');




