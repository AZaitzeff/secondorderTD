N=1024;
[X,Y,~,~,Z0,h,~]=initialdata(N,0);
nt= ceil(T/(h^2/8));
dt=T/nt;
tic;
[Ztrue]=evolve(nt,dt,Z0,h);
toc;
save(['graphZ' num2str(N) '.mat'],'Ztrue','X','Y','N')