
T=1/10;

nts=[4,8,16,32,64];
n=numel(nts);




error1=zeros(2,n);
for i=1:7
    nt=nts(i);
    N=256;
    dt=T/nt;
    [X,Y,pX,pY,Z,h,pd]=initialdata(N,dt);
    Z=thres_dynamics_diffkern(X,Y,pX,pY,Z,pd,dt,nt,h,N);
end