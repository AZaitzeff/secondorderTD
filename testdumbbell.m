
vectorType1 = coder.typeof(1, [1 numpts], [false false]);
if double
    codegen thres_dynamic_3dcyl_double -args {vectorType1,1,vectorType1,1,1,1}
else
    codegen thres_dynamic_3dcyl -args {vectorType1,1,vectorType1,1,1,1}
end

n=numel(Ns);

 for i=1:n
     tic;
     [z,dz,r]=initialcos(numpts);
     dr=dz;
     N=Ns(i);
     t=T/N;
     for iter=1:N
         if double
            [r]=thres_dynamic_3dcyl_double_mex(z,dz,r,dr,numpts,t);
         else
            [r]=thres_dynamic_3dcyl_mex(z,dz,r,dr,numpts,t);
         end
     end
     if double
        save(['results/dbdouble' num2str(T*100) 'np' num2str(numpts) 'N' num2str(N) '.mat'],'r','z')
     else
        save(['results/db' num2str(T*100) 'np' num2str(numpts) 'N' num2str(N) '.mat'],'r','z')
     end
     toc;
 end

%save(['db' num2str(T*100) 'np' num2str(numpts) 'N' num2str(N) '.mat'],'r','z')

%for i=2:n
%   error1(2,i)=(log(error1(1,i-1))-log(error1(1,i)))/log(2);
%end
