function [newr]=thres_dynamic_3dcyl(z,dz,r,dr,N,t)

R=14*sqrt(t);
thisr=zeros(1,3*N-2);
thisz=-5:dz:10;

thisr(1:N)=r(N:-1:1);
thisr(N+1:(2*N-1))=r(2:N);
thisr(2*N:3*N-2)=r((N-1):-1:1);

newr=zeros(1,N);
for n=1:N
    if r(n)>0
        mask=abs(thisz-z(n))<R;
        fun = @(r) convolgauss3dcyl(r,z(n),thisz(mask),thisr(mask),t,dr,dz)-.5;
        if fun(0)<0
            newr(n)=0;
        else
            newr(n)=secantmethod(r(n),fun);
        end
        

    else
        newr(n)=0;

    end


end


end