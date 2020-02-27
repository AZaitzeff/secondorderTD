function [val] = convolgauss3dcyl(r,z,zs,fs,t,dr,dz)
%Convolution with a cylinderical symmetric function
if r<0 
    error('r<0')
end
n=numel(zs);
val=0;
tol=1e-16;
for i = 1:n
    f=fs(i);
    if f>tol
        N=ceil(f/dr);
        df=f/N;
        rb=0:df:f;
        tempval=(sum(rb.*(exp(-(r^2-2*r*rb+rb.^2)/(4*t)).*real(besseli(0,r*rb/(2*t),1))))-1/2*(exp(-(r^2-2*r*f+f^2)/(4*t))*real(besseli(0,r*f/(2*t),1)))*f);
        totalz=tempval*(df/(4*sqrt(pi)*(t)^(3/2))*exp(-(z-zs(i))^2/(4*t))*dz);
        if i==1 || i==n
            val=val+1/2*totalz;
        else
            val=val+totalz;
        end
    end
end


end

