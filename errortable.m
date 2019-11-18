vars=load(['graphZ1024']);
trueZ=vars.Ztrue;
N=1024;
[trueX,trueY,~,~,~,h1,~]=initialdata(1024,.01);
nts=[4,8,16,32,64];
n=numel(nts);
error1=zeros(2,n);
for numt=1:3
    nt=nts(numt);
    N=256;
    [X,Y,pX,pY,Z,h,pd]=initialdata(N,.01);
    load(['TD2stage' num2str(N) 't' num2str(nt)]);
    tZ= interp2(X,Y,Z,trueX,trueY,'spline');
    error1(1,numt)=sqrt(sum((tZ(:)-Z(:)).^2)*h^2);
end
for i=2:n
    error1(2,i)=(log(error1(1,i-1))-log(error1(1,i)))/log(2);
end