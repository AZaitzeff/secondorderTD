
T=.5;
numpts=501;
N=8192;
vars=load(['results/db' num2str(T*100) 'np' num2str(numpts) 'N' num2str(N) '.mat']);
truer=vars.r;
truez=vars.z;
dz=truez(2)-truez(1);
plot(truez,truer,'k');hold on
nts=[64,128,256,512];
n=numel(nts);
error1=zeros(2,n);
for numt=1:n
    N=nts(numt);
    load(['results/dbdouble' num2str(T*100) 'np' num2str(numpts) 'N' num2str(N) '.mat']);
    error1(1,numt)=sqrt(dz*sum((r-truer).^2));
    plot(z,r);
end

for i=2:n
    error1(2,i)=(log(error1(1,i-1))-log(error1(1,i)))/log(2);
end