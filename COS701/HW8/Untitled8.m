tic
figure(1)
n=500
Xn = rand(n,1)
Yn = rand(n,1)
dt = delaunayTriangulation(Xn,Yn);
k = convexHull(dt);
plot(dt.Points(:,1),dt.Points(:,2), '.', 'markersize',10); hold on;
plot(dt.Points(k,1),dt.Points(k,2), 'r'); hold off;
t1=toc

tic
figure(2)
n=10000
Xn = rand(n,1)
Yn = rand(n,1)
dt = delaunayTriangulation(Xn,Yn);
k = convexHull(dt);
plot(dt.Points(:,1),dt.Points(:,2), '.', 'markersize',10); hold on;
plot(dt.Points(k,1),dt.Points(k,2), 'r'); hold off;
t2=toc
figure(3)
time=[t1,t2]
% time1=[1,t1];
% time2=[2,t2];
stem(time);