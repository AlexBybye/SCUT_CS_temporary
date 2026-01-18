function [x,i]=erfen(a,b,e)
for i=1:1000
    x=a+(b-a)/2;                 %a与b中间的值
    if (fc(x)==0|(b-a)/2<e)   %判断是否已为根或已达到误差允许范围
        x ;                              %近似根
        i ;                               %迭代次数
        break;
    else
        if (fc(a)*fc(x)>0)
            a=x;                      %这几句用于缩小根所在的区间
        else
            b=x;
        end
    end
end
