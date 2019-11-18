function [A,B,C]=getconsistvarsTD(gamma,theend)
N=size(gamma,1);
A=zeros(1,N);
B=zeros(1,N);
C=zeros(1,N);
%D=zeros(1,N);
%E=zeros(1,N);
A(1)=1;
B(1)=1/2;
C(1)=-2/3;
%D(1)=1;
%E(1)=-2;
for i=2:N
    theA=sum(A(1:i-1).*gamma(i,2:i));
    theB=sum(B(1:i-1).*gamma(i,2:i));
    theC=sum(C(1:i-1).*gamma(i,2:i));
    %theD=sum(D(1:i-1).*gamma(i,2:i));
    %theE=sum(E(1:i-1).*gamma(i,2:i));

    A(i)=1+theA;
    B(i)=1/2+theB+theA;
    C(i)=-2/3+theC-2*theA;
    %D(i)=1+theD;
    %E(i)=-2+theE;
end

if theend==1
    A=A(N);
    B=B(N);
    C=C(N);
    %D=D(N);
    %E=E(N);
end

end