function val = convolguass(x,y,z,x0,y0,z0,t,h)
%CONVOLGUASS Summary of this function goes here
%   1/2 already removed. set on bottom is one
val=sum(exp(-(x-x0).^2/(4*t)).*exp(-(y-y0).^2/(4*t)).*erf((z-z0)/(2*sqrt(t))))/(8*pi*t)*h^2;
end

