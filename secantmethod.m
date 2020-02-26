function p=secantmethod(x0,fun)

    tol=1e-10;
    maxiter=1000;
    h=1e-4;
    %invh=1e4;
    me=1e-12;
    x1=x0-h;
    f0=fun(x0);
    %disterror=0;
    for i=1:maxiter
        f1=fun(x1);
        if abs(f1)<tol
            break
        end
        df=(x1-x0)/(f1-f0+me);
        x0=x1;
        f0=f1;
        x1=x1-f1*(df);
    end
    p= x1;
end