
   

x=(1:1:10);
y=x.^2;
subplot(2,2,1)
plot(x,y,'r');

rng(33);
%rng(5);
%iseed = 1
    count= 1;
for i=1:10

y2(count)=y(count)+(-1+(1-(-1))*rand(1,1))*20;
%y2(count) = y+(rand(iseed)-0.5)*3;
count = count +1;
end
%y2 = y+(rand(iseed)-0.5)*3;
%end
%hond on
%x=(1:1:10);
subplot(2,2,2);
plot(x,y,'r')
hold on;
plot(x,y2);
hold off;


% 
% ave = [];
% for m=1:100
%     for n = 1:8
%      ave=[ave,((y2(1,n) + y2(1,n+1)+ y2(1,n+2))/3)];
%      ave(1,:)=(y2(1,n) + y2(1,n+1)+ y2(1,n+2))/3;
%     end
%  
% end
% m_ave = [ave(793:800)];




count4=1;

% ty2(1)=0;
% ty2(2:11)=y2;
% ty2(12)=0

ty2=y2;



for m =1: 10
    count4=1;
    for n= 1:8
        my_y(count4)=(ty2(n) + ty2(n+1)+ ty2(n+2))/3; count4=count4+1;
        
    end
    %ty2(1)=(ty2(1)+ty2(2))/2;
    ty2(2:9)=my_y;
    %ty2(10)=(ty2(9)+ty2(10))/2;
end
    
 %t1=(y2(1:1)+y(1))/2;
 %t10=(y2(10:10)+y(10))/2;
 
 y3 = [y2(1:1),ty2(2:9),y2(10:10)];
 x2=(1:1:8);
 subplot(2,2,3);
 plot(x,y3,'g'); 
 hold on;
 plot(x,y,'r');
 hold on;
 plot(x,y2);
 hold off;
 
 
 %subplot(2,2,4);
% plot(x,y,x,y3);
    
    
