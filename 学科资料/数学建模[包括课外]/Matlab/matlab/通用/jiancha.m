if exist('*.m')==0                                           %在星号处输入文件名(把星号改为文件名)
   disp('没有为方程创建名为*.m的函数文件,请参照下例建立它');
   disp('function y=*(x)');
   disp('y=x^3-4*x^2+1');
   disp('并将该文件保存在work文件夹下');
end 