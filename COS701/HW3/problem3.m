load('data.txt')

for i=1:29
    x(i)=data(i,1)
    y(i)=data(i,2)
end

subplot(2,1,1)
plot(x,y);
hold on;

subplot(2,1,2)

plot(x,y);

n=2;% how many guassians do you want to use

%t_y=y(1:10,:);
temp_y = sort(y(1,1:10),'descend'); % 
mark = temp_y(n);
index = find(y>mark);% find the several index of maximum numvers
%[v,index]= max(y);


for i=1:n-1;   % n guassians
sigma=1;  
my_i = index(i);
x_g=-15:0.1:10;
m_y=2.5*y(my_i)*(1/((sqrt(2*pi))*sigma))*exp(-((x_g-x(my_i)).^2)/(2*sigma.^2));
my_g_y(1:100)=m_y(1:100)
hold on;
plot(x_g,m_y,'-g','LineWidth',1.5);
end
%my_g_ny(1:29)=0;
my_g_ny(1)=y(7)

%%%%%%%%%%%%%%%%%%%%

temp_y = sort(y(1,11:16),'descend'); % 
mark = temp_y(n);
index = find(y>mark);% find the several index of maximum numvers
%[v,index]= max(y);


for i=1:n-1;   % n guassians
sigma=1;  
my_i = index(i);
x_g=-15:0.1:10;
m_y=2.5*y(my_i)*(1/((sqrt(2*pi))*sigma))*exp(-((x_g-x(my_i)).^2)/(2*sigma.^2));
my_g_y(100:150)=m_y(100:150)
hold on;
plot(x_g,m_y,'-g','LineWidth',1.5);
end
my_g_ny(2)=y(15)
%%%%%%%%%%%%%%%%%%%%%%%

temp_y = sort(y(1,16:29),'descend'); % 
mark = temp_y(n);
index = find(y(1,16:29)>mark);% find the several index of maximum numvers
index = index+15;
%[v,index]= max(y);


for i=1:n-1;   % n guassians
sigma=1;  
my_i = index(i);
x_g=-15:0.1:10;
m_y=2.5*y(my_i)*(1/((sqrt(2*pi))*sigma))*exp(-((x_g-x(my_i)).^2)/(2*sigma.^2));
my_g_y(150:251)=m_y(150:251)
hold on;
plot(x_g,m_y,'-g','LineWidth',1.5);
end

my_g_ny(3)=y(24)% use x and my_g_ny
my_g_nx=[-9.989,-2.40,2.14]
my_g_y  %guassian

% for i = 1:29;   % 29 points totally
% sigma=1;  
% x_g=-15:0.0001:10;
% m_y=2.5*y(i)*(1/((sqrt(2*pi))*sigma))*exp(-((x_g-x(i)).^2)/(2*sigma.^2));
% hold on;
% plot(x_g,m_y,'-g','LineWidth',1.5);
% end

hold off 



% a=6;sigma=1; 
% x=-10:0.0001:10;
% y=2000*(1/((sqrt(2*pi))*sigma))*exp(-((x+5).^2)/(2*sigma.^2));
% plot(x,y,'-g','LineWidth',1.5);
% 
% 
% 
% a=6;sigma=1;  
% x=-10:0.0001:10;
% y=4000*(1/((sqrt(2*pi))*sigma))*exp(-((x-a).^2)/(2*sigma.^2));
% plot(x,y,'-g','LineWidth',1.5);
% 
% a=0;sigma=1;
% x=-10:0.0001:10;
% y=4000*(1/((sqrt(2*pi))*sigma))*exp(-((x-3).^2)/(2*sigma.^2));
% plot(x,y,'r','LineWidth',1.5);
% 
% a=0;sigma=1; 
% x=-10:0.0001:10;
% y=5000*(1/((sqrt(2*pi))*sigma))*exp(-((x+3).^2)/(2*sigma.^2));
% plot(x,y,'r','LineWidth',1.5);

% xlabel('sigma=1');
% ylabel('f(x)');




