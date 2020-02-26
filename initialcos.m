function [z,dz,r]=initialcos(N)

dz=5/(N-1);
z=0:dz:5;
r=2-cos((z)*pi/5);
%r(z<2.5)=1;