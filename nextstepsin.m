function [newy]=nextstepsin(x,y,t,N,gamma,kernals)

numsteps=size(gamma,1);
tempy=zeros(numsteps,3*N+1);
for z=1:numsteps
    for n=(N+1):(2*N)
        fun=@(py) gamma(z,1)*kernals{z,1}(x,y,x(n),py,t);
        for i=2:z
            fun=@(py) fun(py)+gamma(z,i)*kernals{z,i}(x,tempy(i-1,:),x(n),py,t);
        end
        inity=y(n);
        if z>1
            inity=tempy(z-1,n);
        end
        tempy(z,n)=secantmethod(inity,fun);
        
        
    end
    tempy(z,N:-1:2)=tempy(z,N+2:2*N);
    tempy(z,3*N+1:-1:2*N+2)=-tempy(z,N+1:2*N);
end
newy=tempy(numsteps,:);    
    



end