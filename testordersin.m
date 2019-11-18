
T=1;%time value
numpts=4001;
[x0,u0]=grimreaperwave(numpts,0,1);
[x0,u]=grimreaperwave(numpts,T,1);%true solution

h=(x0(2)-x0(1));
if Table==2
    kernal1=@(x,y,z,py,zt)(convguass(x,y,z,py,zt)-1/2);
    kernal2=@(x,y,z,py,zt)(convguass(x,y,z,py,zt/2)-1/2);
    gamma=[[1,0];[-1,sqrt(2)]];
 
  kernals=cell(2,2);
  for i=1:2
      for j=1:2
          kernals{i,j}=kernal2;
          
      end
  end
  kernals{2,1}=kernal1;
  kernals{1,2}=kernal1;
elseif Table==3
    gamma=getgamma2ndorder();
    kernal1=@(x,y,z,py,zt)(convguass(x,y,z,py,zt)-1/2);
    kernals=cell(4,4);
    for i=1:4
        for j=1:4
            kernals{i,j}=kernal1;

        end
    end
else
    gamma=[[1]];
    kernal1=@(x,y,z,py,zt)(convguass(x,y,z,py,zt)-1/2);
    kernals=cell(1,1);

    kernals{1,1}=kernal1;
end

Ns=[8,16,32,64,128,256];
n=numel(Ns);

error1=zeros(2,n);
 for i=1:n
     tic;
     [x,y]=grimreaperwave(numpts,0,0);
     N=Ns(i);
     t=T/N;
     for iter=1:N
         [y]=nextstepsin(x,y,t,numpts,gamma,kernals);

     end
     error1(1,i)=sqrt(4*sum((y(numpts+1:2*numpts)-u(1:numpts)).^2)*h);
     toc;
 end



for i=2:n
    error1(2,i)=(log(error1(1,i-1))-log(error1(1,i)))/log(2);
end
