rng(34)
clear all;
close all;
clc;



%tic
my_n=500

for i =1:my_n
t_x = 30*rand(1,1);
x(i,1) = t_x;
t_y = 30*rand(1,1);
y(i,1) = t_y;
end

n=length(x);
p=[];
for i=1:n
   p=[p;x(i) y(i)];     %collect convex hull points
end
figure(1)
subplot(1,2,1)
plot(x,y,'.');

%%
[t index]=max(p(:,2));  %find the index of the bigges value
tmp_p=p(index,:);         %find the biggest point
tmp_heng=[tmp_p(1)+30,tmp_p(2)];    %set a point that is in the same line of biggest point

for i=1:n           %
    theta(i)=multi_jiao(tmp_heng,p(i,:),tmp_p);  %caculate the angle between every point and the biggest point
end
theta=theta';
p=[p theta];

p=sortrows(p,3);    %sort by the third column, that is angle

re{1}=p(n,1:2);     %re like stack
re{2}=p(1,1:2);
re{3}=p(2,1:2);
top=3;    % pointer of stack top

for i=3:n
    while multi(p(i,1:2),re{top-1},re{top})>=0      
        top=top-1;       
    end
    top=top+1;
    re{top}=p(i,1:2)
end

%figure(2);
count1=1;
count2=1;
subplot(1,2,2)
ln=length(re)
for t_n=1:ln-1
   r_x(t_n)=re{t_n}(1,1);
   r_y(t_n)=re{t_n}(1,2);
end
for t_n=1:ln-2
   line([r_x(t_n),r_x(t_n+1)],[r_y(t_n),r_y(t_n+1)]);
   hold on;
end
line([r_x(ln-1),r_x(1)],[r_y(ln-1),r_y(1)]);
hold off;

t1=toc
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%tic
my_n2=10000                                   

for i =1:my_n2
t_x = 30*rand(1,1);
x(i,1) = t_x;
t_y = 30*rand(1,1);
y(i,1) = t_y;
end

n=length(x);
p2=[];
for i=1:n
   p2=[p2;x(i) y(i)];     %collect convex hull points
end
figure(2)
subplot(1,2,1)
plot(x,y,'.');


[t index]=max(p2(:,2));   %find the index of the bigges value
tmp_p=p2(index,:);          %find the biggest point
tmp_heng=[tmp_p(1)+30,tmp_p(2)];     %set a point that is in the same line of biggest point

for i=1:n         
    theta2(i)=multi_jiao(tmp_heng,p2(i,:),tmp_p);  %caculate the angle between every point and the biggest point
end
theta2=theta2';
p2=[p2 theta2];

p2=sortrows(p2,3);    %sort by the third column, that is angle

re{1}=p2(n,1:2);    %re like stack
re{2}=p2(1,1:2);
re{3}=p2(2,1:2);
top=3;     % pointer of stack top

for i=3:n-1
    while multi(p2(i,1:2),re{top-1},re{top})>=0       
        top=top-1;       
    end
    top=top+1;
    re{top}=p2(i,1:2)
end

%figure(2);
count1=1;
count2=1;
subplot(1,2,2)
ln=length(re)
for t_n=1:ln-1
   r_x(t_n)=re{t_n}(1,1);
   r_y(t_n)=re{t_n}(1,2);
end
for t_n=1:ln-2
   line([r_x(t_n),r_x(t_n+1)],[r_y(t_n),r_y(t_n+1)]);
   hold on;
end
line([r_x(ln-1),r_x(1)],[r_y(ln-1),r_y(1)]);
hold off;

%t2=toc

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
my_n=500;count = 1;
for my_n=500:500:10000
      clear theta3;
    tic;
    for i =1:my_n
    t_x = 30*rand(1,1);
    x(i,1) = t_x;
    t_y = 30*rand(1,1);
    y(i,1) = t_y;
    end

    n=length(x);
    p=[];
    for i=1:n
       p=[p;x(i) y(i)];     %collect convex hull points
    end
    % figure(1)
    % subplot(1,2,1)
    % plot(x,y,'.');

    %%
    [t index]=max(p(:,2));  %find the index of the bigges value
    tmp_p=p(index,:);         %find the biggest point
    tmp_heng=[tmp_p(1)+30,tmp_p(2)];    %set a point that is in the same line of biggest point

    for i=1:n           %
        theta3(i)=multi_jiao(tmp_heng,p(i,:),tmp_p);  %caculate the angle between every point and the biggest point
    end
    theta3=theta3';
    p=[p,theta3];

    p=sortrows(p,3);    %sort by the third column, that is angle

    re{1}=p(n,1:2);     %re like stack
    re{2}=p(1,1:2);
    re{3}=p(2,1:2);
    top=3;    % pointer of stack top

    for i=3:n
        while multi(p(i,1:2),re{top-1},re{top})>=0      
            top=top-1;       
        end
        top=top+1;
        re{top}=p(i,1:2)
    end

    %figure(2);
    count1=1;
    count2=1;
    subplot(1,2,2)
    ln=length(re)
    for t_n=1:ln-1
       r_x(t_n)=re{t_n}(1,1);
       r_y(t_n)=re{t_n}(1,2);
    end
    % for t_n=1:ln-2
    %    line([r_x(t_n),r_x(t_n+1)],[r_y(t_n),r_y(t_n+1)]);
    %    hold on;
    % end
    %line([r_x(ln-1),r_x(1)],[r_y(ln-1),r_y(1)]);
    %hold off;
    
    temp_t=toc
    time(count) = temp_t; count= count +1;
  
end
figure(3)
tt_x = [500:500:10000];
stem(tt_x,time); ylabel('cpu running time');xlabel('n points');
