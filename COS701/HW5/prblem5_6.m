X = 30*rand(1,1);
Y = 30*rand(1,1);
my_x=[X];
my_y=[Y];
my_n_x=[];
my_n_y=[];

R = 1.8;
n = 150;
flag1 =1;
flag2 =1;
count1 = 1;
count2 = 1;
count3 = 1;
count4 = 1;
count5 = 1;
for i =1:n
T_X = 30*rand(1,1);
X(i) = T_X;
T_Y = 30*rand(1,1);
Y(i) = T_Y;
end
subplot(2,2,1);
plot(X,Y,'.');
ylabel('Original points');

while(flag1<=n)
   t_x = 30*rand(1,1);
   t_y = 30*rand(1,1);
   for i=1:size(my_x,2)
       distance = sqrt((t_x-my_x(i))^2+(t_y-my_y(i))^2);
       if distance < R
           flag2=2;
       end
   end
    if flag2==1;
        my_x(size(my_x)+1)=t_x;
        my_y(size(my_y)+1)=t_y;
        flag1 = flag1+1;
    end
flag2 = 1;
end


subplot(2,2,2);
plot(my_x,my_y,'.');
ylabel('new points');




tri = delaunay(my_x,my_y); 
subplot(2,2,3);
triplot(tri,my_x,my_y);




%n = n+1

for i = 1:n-2
    for j = i+1:n-1
       
       for k = j+1:n
           if i~=j&&i~=k&&j~=k
               flag = 1; 
               flag1 = 0;
               flag2 = 0;
                 cen1 = (my_x(i)+my_x(j))/2;
                 cen1 = [cen1,(my_y(i)+my_y(j))/2];
                 
                 cen2 = (my_x(i)+my_x(k))/2;
                 cen2 = [cen2,(my_y(i)+my_y(k))/2];

                 k1= -1/((my_y(i)-my_y(j))/(my_x(i)-my_x(j)));  
                 b1 = cen1(2)-k1*cen1(1);
                 
                 k2= -1/((my_y(i)-my_y(k))/(my_x(i)-my_x(k)));
                 b2=cen2(2)-k2*cen2(1);
                 
                 x0=-(b1-b2)/(k1-k2)           
                 y0=-(-b2*k1+b1*k2)/(k1-k2)
                 
                 r=sqrt((y0-my_y(i))^2+(x0-my_x(i))^2)
                 
                 
                  q=1;
                  while (q<n&&flag==1)
                      if(q==i||q==j||q==k)
                           q = q+1;
                      end
                     t_r = sqrt((my_x(q)-x0)^2+(my_y(q)-y0)^2);
                     if  r < t_r   
                         flag1 = 1;
                       
                     else
                         flag = 0;
                     end
                     q = q+1;
                  end
                 
                theta1=acosd(dot([my_x(j)-my_x(i),my_y(j)-my_y(i)],[my_x(k)-my_x(i),my_y(k)-my_y(i)])/(norm([my_x(j)-my_x(i),my_y(j)-my_y(i)])*norm([my_x(k)-my_x(i),my_y(k)-my_y(i)])));
               % theta2=acosd(dot([my_x(j)-my_x(i),my_y(j)-my_y(i)],[my_x(k)-my_x(i),my_y(k)-my_y(i)])/(norm([my_x(j)-my_x(i),my_y(j)-my_y(i)])*norm([my_x(k)-my_x(i),my_y(k)-my_y(i)])));

                 %if ((theta1+theta2)> 10&&(theta1+theta2)< 170)
                % if ((theta1+theta2)< 170&&(theta1+theta2)>0)
                if ((theta1>0)&&(theta1<170))
                     flag2 = 1;              
                 end
                 
                 

                 if (flag1==1&&flag2==1&&flag==1)
                         My_indexI(count3) = i;count3 = count3+1;
                         My_indexJ(count4) = j;count4 = count4+1;
                         My_indexK(count5) = k;count5 = count5+1; 
                 end
          end
       end 

    end

end
%num = size(My_index,2)/3;
%num = lenght(My_indexI);
subplot(2,2,4);
for  n=1:count3-1
    line([my_x(My_indexI(n)),my_x(My_indexJ(n))],[my_y(My_indexI(n)),my_y(My_indexJ(n))]);
    line([my_x(My_indexJ(n)),my_x(My_indexK(n))],[my_y(My_indexJ(n)),my_y(My_indexK(n))]);
    line([my_x(My_indexK(n)),my_x(My_indexI(n))],[my_y(My_indexK(n)),my_y(My_indexI(n))]);
end

hold off;





