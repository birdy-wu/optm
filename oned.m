function [ x,f,it ] = oned(a,b,tol)
%   输入值a,b是最优解所在区间，此处为1.4和1.5，tol为收敛精度。
%   输出值x是三维向量，值分别是三种方法得到的最优解，f是三维向量，值分别是三种方法得到的最优函数值
%   it是三维向量分别是三种方法所需迭代数。
    function y=g(t)
        y=t^4/4-t^3/3-t;
    end
% 平分法
a0=a;
b0=b;
x0=(a+b)/2;
it1=1;
x1=x0+1;
while abs(x1-x0)>tol
    if df(a0)*df(x0)<0
        b0=x0;
    elseif df(b0)*df(x0)<0
        a0=x0;
    else
        break;
    end
    
    x1=x0;
    x0=(a0+b0)/2;
    it1=it1+1;
end
f1=g(x1);

function y=df(x)
y=x^3-x^2-1;
end


% 黄金分割法
it2=1;
m=1-(sprt(5)-1)/2;
t2=a+m*(b-a);
w2=g(t2);
t1=a+b-t2;
f1=g(t1);
while abs(t1-t2)>tol
    if f1<w2
        a=t2;
        t2=t1;
        w2=f1;
        t1=a+b-t2;
        f1=g(t1);
    else
        b=t1;
        t1=t2;
        f1=w2;
        t2=a+m8(b-a);
        w2=g(t2);
    end
    it2=it2+1;
end
x2=(t1+t2)/2;
f2=g(x2);

%  牛顿法

function y=ddf(x)
y=3*x^2-2*x;
end

function y=dddf(x)
y=6*x-2;
end



%  结果输出
x=[x1,x2,x3]
f=[f1,f2,f3]
it=[it1,it2,it3]

end
