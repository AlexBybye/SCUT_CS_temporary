function yhat=Logisfun(beta,x)
yhat=beta(1)./(1+(beta(1)/beta(2)-1).*exp(-beta(3).*x));