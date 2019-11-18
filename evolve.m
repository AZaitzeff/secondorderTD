function [u]=evolve(nt,dt,u0,h)
n=size(u0,1);
u = padarray(u0,[2,2],'circular');

for t=1:nt
    fxx=u(3:n+2,2:n+1)-2*u(3:n+2,3:n+2)+u(3:n+2,4:n+3);
    fxy=(u(2:n+1,2:n+1)-u(4:n+3,2:n+1)-u(2:n+1,4:n+3)+u(4:n+3,4:n+3))/4;
    fyy=u(2:n+1,3:n+2)-2*u(3:n+2,3:n+2)+u(4:n+3,3:n+2);
    fx=(-u(3:n+2,2:n+1)+u(3:n+2,4:n+3))/2;
    fy=(-u(2:n+1,3:n+2)+u(4:n+3,3:n+2))/2;
    curvature=(fxx+fyy+(fxx.*fy.^2-2*fx.*fy.*fxy+fyy.*fx.^2)/h^2)./(fx.^2+fy.^2+h^2);
    u(3:n+2,3:n+2)=u(3:n+2,3:n+2)+dt*curvature;
    u = padarray(u(3:n+2,3:n+2),[2,2],'circular');
end
u=u(3:n+2,3:n+2);