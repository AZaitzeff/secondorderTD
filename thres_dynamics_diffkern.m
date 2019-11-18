function Z=thres_dynamics_diffkern(X,Y,pX,pY,Z,pd,dt,nt,h,N)




R=14*sqrt(dt);

for t=1:nt
    newZ=padarray(Z,[pd,pd],'circular');


    for ind=1:(N*N)
        x0=X(ind);
        y0=Y(ind);
        mask=((x0-pX).^2+(y0-pY).^2)<R^2;
        x=pX(mask);
        y=pY(mask);
        z=newZ(mask);
        fun=@(z0)convolguass(x,y,z,x0,y0,z0,dt/2,h);

        Z(ind) = secantsearch(fun, Z(ind));

    end

    newZs=padarray(Z,[pd,pd],'circular');
    for ind=1:(N*N)
        x0=X(ind);
        y0=Y(ind);
        mask=((x0-pX).^2+(y0-pY).^2)<R^2;
        x=pX(mask);
        y=pY(mask);
        z1=newZ(mask);
        z2=newZs(mask);
        fun=@(z0) sqrt(2)*convolguass(x,y,z2,x0,y0,z0,dt/2,h)-convolguass(x,y,z1,x0,y0,z0,dt,h);   
        Z(ind) = secantsearch(fun, Z(ind));

    end

end

save(['TD2stagen' num2str(N) 't' num2str(nt) '.mat'],'Z','X','Y','N')
end


function p = secantsearch(fun, x0)

    tol=1e-9;
    maxiter=1000;
    me=1e-12;
    x1=x0+1e-4;
    f0=fun(x0);
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