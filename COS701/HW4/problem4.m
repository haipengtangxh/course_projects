% a(1,0),b(2,3),c(3,2);
xy=[1 0;2 3;3 2] %
% syms x0 y0 R
% f=(xy(:,1)-x0).^2+(xy(:,2)-y0).^2-R^2 %????????
% [R,x0,y0]=solve(f(1),f(2),f(3))
% R=eval(R(1)),x0=eval(x0(1)),y0=eval(y0(1))%??????????
% t=0:pi/20:2*pi;
% x=R*cos(t)+x0;y=R*sin(t)+y0;
% plot(x,y,[xy(:,1);xy(1,1)] ,[xy(:,2);xy(1,2)])%???
% axis equal,grid
% figure
% plot(x,y,xy(:,1) ,xy(:,2),'*r')
% axis equal,grid

[x,y]=solve('(x-1)^2+(y-0)^2=(x-2)^2+(y-3)^2', '(x-1)^2+(y-0)^2=(x-3)^2+(y-2)^2');
R=sqrt((x-1)^2+(y-0)^2);
r = double(R)
X=x+R*cos(0:0.01:2*pi);
Y=y+R*sin(0:0.01:2*pi);

plot(X,Y)
hold on
plot(x,y,'.')
hold on
plot(1,0,'.')
hold on
plot(2,3,'.')
hold on
plot(3,2,'.')

hold off