function [x,f,it] = conj(Q,b,c,tol)
b=b(:);
n=length(b);
x0=ones(n,l);
it=0;
err=1;
df=Q*x0+b;
while err>tol
    p=-df;
    alpha=(p'*df)/(p'*Q*p);
    x=x0+alpha*d;
    x0=x;
    df=Q*x+b;
    lambda=(p'*df)/(p'*Q*p);
    p=lambda*p-df;
    err=norm(df);
    it=it+1;
    if it>1000;
        break;
    end
end

f=0.5*x'*Q*x+b'*x+c;

end