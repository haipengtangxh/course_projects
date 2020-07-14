X = 30*rand(1,1);
Y = 30*rand(1,1);
my_x=[X];
my_y=[Y];
my_n_x=[];
my_n_y=[];

R = 1;
n = 100;
flag1 =1;
flag2 =1;
flag8=0;
count1 = 1;
count2 = 1;
count3=1;
count4=1;
count5=1;
count6=1;
count7=1;



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


subplot(2,2,1);
plot(my_x,my_y,'.');
ylabel('Original points');


tri = delaunay(my_x,my_y); 
subplot(2,2,2);
triplot(tri,my_x,my_y);


subplot(2,2,3);
%voronoi(my_x,my_y)



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
                         My_centerX(count6) = x0;count6 = count6+1;
                         My_centerY(count7) = y0;count7 = count7+1;
                 end
          end
       end 

    end

end
%num = size(My_index,2)/3;
%num = lenght(My_indexI);
%subplot(2,2,4);

for  n=1:count3-1
    for m = 1:count3-1
        if (My_indexI(n)==My_indexI(m)&&My_indexJ(n)==My_indexJ(m))||(My_indexI(n)==My_indexJ(m)&&My_indexJ(n)==My_indexI(m))||(My_indexI(n)==My_indexI(m)&&My_indexJ(n)==My_indexK(m))||(My_indexI(n)==My_indexK(m)&&My_indexJ(n)==My_indexI(m))||(My_indexI(n)==My_indexJ(m)&&My_indexJ(n)==My_indexK(m))||(My_indexI(n)==My_indexK(m)&&My_indexJ(n)==My_indexJ(m))||...
            (My_indexI(n)==My_indexI(m)&&My_indexK(n)==My_indexJ(m))||(My_indexI(n)==My_indexJ(m)&&My_indexK(n)==My_indexI(m))||(My_indexI(n)==My_indexI(m)&&My_indexK(n)==My_indexK(m))||(My_indexI(n)==My_indexK(m)&&My_indexK(n)==My_indexI(m))||(My_indexI(n)==My_indexJ(m)&&My_indexK(n)==My_indexK(m))||(My_indexI(n)==My_indexK(m)&&My_indexJ(n)==My_indexK(m))||...
            (My_indexJ(n)==My_indexI(m)&&My_indexK(n)==My_indexJ(m))||(My_indexJ(n)==My_indexJ(m)&&My_indexK(n)==My_indexI(m))||(My_indexJ(n)==My_indexI(m)&&My_indexK(n)==My_indexK(m))||(My_indexJ(n)==My_indexK(m)&&My_indexK(n)==My_indexI(m))||(My_indexJ(n)==My_indexJ(m)&&My_indexK(n)==My_indexK(m))||(My_indexJ(n)==My_indexK(m)&&My_indexK(n)==My_indexJ(m))
                    flag8=1;                                                                                                                                                                        voronoi(my_x,my_y);
                if(flag8==1)
                    break
                else
                line([My_centerX(n),My_centerX(m)],[My_centerY(n),My_centerY(m)]);
                end
            hold on;
        end
    end
end
hold off;
































% 
% for i = 1:n-1
%     for j = i+1:n-1
%        for k = j+1:n
%            if i~=j&&i~=k&&j~=k
%                 flag = 0; flag2 = 1;
%                syms x y 
%                   s1 = sqrt((my_x(i)-x)^2+(my_y(i)-y)^2);
%                   s2 = sqrt((my_x(j)-x)^2+(my_y(j)-y)^2);
%                   s3 = sqrt((my_x(k)-x)^2+(my_y(k)-y)^2); 
%                   eq1=s1-s2;  
%                   eq2=s2-s3; 
%                   [x,y]=solve(eq1,eq2,'x','y');
%                   x = double(x)
%                   y = double(y)
%                   
%                   r = sqrt((my_x(i)-x)^2+(my_y(i)-y)^2);
%                   
%                   my_n_x(count1) = x; count1 = count1+1;
%                   my_n_y(count2) = y; count2 = count2+1; 
%                   my_i(count3)=i; 
%                   my_j(count4)=j;
%                   my_k(count5)=k;
%                   
% % %                   
% % %                   while (q<n)
% % %                       t_r = sqrt((my_x(q)-x)^2+(my_y(q)-y)^2);
% % % 
% % %                     d1 = sqrt((my_x(j)-my_x(i)).^2 + (my_y(j)-my_y(i)).^2);
% % %                     d2 = sqrt((my_x(k)-my_x(i)).^2 + (my_y(k)-my_y(i)).^2);
% % %                                            
% % %                    [x,y]=solve('(x-my_x(i))^2+(y-my_y(i))^2=(my_x(i)-2)^2+(y-3)^2', '(x-1)^2+(y-0)^2=(x-3)^2+(y-2)^2');
% % %                    R=sqrt((x-1)^2+(y-0)^2);
% % %     %               my_n_x(count1)=my_x(i); count1 = count1+1; 
% % %     %               my_n_x(count1)=my_x(j); count1 = count1+1; 
% % %                   my_n_x(count1)=my_x(k); count1 = count1+1; 
% % %     %               my_n_y(count2)=my_y(i); count2 = count2+1; 
% % %     %               my_n_y(count2)=my_y(j); count2 = count2+1; 
% % %                   my_n_y(count2)=my_y(k); count2 = count2+1; 
% % % 
% % %                      if  r < t_r   
% % %                          flag = 1;
% % %                          flag4=0;
% % %                      else
% % %                          flag = 0;
% % %                      end
% % %                      q = q+1;
% % %                   end
% % % 
% 
% 
% 
%                   
% %                   
% %                   t_r = sqrt((my_x(k+1)-x)^2+(my_y(k+1)-y)^2);
% %                   
% % %                 d1 = sqrt((my_x(j)-my_x(i)).^2 + (my_y(j)-my_y(i)).^2);
% % %                 d2 = sqrt((my_x(k)-my_x(i)).^2 + (my_y(k)-my_y(i)).^2);
% % %                                        
% % %                [x,y]=solve('(x-my_x(i))^2+(y-my_y(i))^2=(my_x(i)-2)^2+(y-3)^2', '(x-1)^2+(y-0)^2=(x-3)^2+(y-2)^2');
% % %                R=sqrt((x-1)^2+(y-0)^2);
% % % %               my_n_x(count1)=my_x(i); count1 = count1+1; 
% % % %               my_n_x(count1)=my_x(j); count1 = count1+1; 
% % %               my_n_x(count1)=my_x(k); count1 = count1+1; 
% % % %               my_n_y(count2)=my_y(i); count2 = count2+1; 
% % % %               my_n_y(count2)=my_y(j); count2 = count2+1; 
% % %               my_n_y(count2)=my_y(k); count2 = count2+1; 
% %                 
% %                  if  r > t_r  %make sure every point is 
% %                      flag = 1;
% %                  end
% %                   
% %                  
% %                  
% %                 theta1=acosd(dot([my_x(i)-my_x(j),my_y(i)-my_y(j)],[my_x(k)-my_x(j),my_y(k)-my_y(j)])/(norm([my_x(i)-my_x(j),my_y(i)-my_y(j)])*norm([my_x(k)-my_x(j),my_y(k)-my_y(j)])));
% %                 theta2=acosd(dot([my_x(j)-my_x(i),my_y(j)-my_y(i)],[my_x(k)-my_x(i),my_y(k)-my_y(i)])/(norm([my_x(j)-my_x(i),my_y(j)-my_y(i)])*norm([my_x(k)-my_x(i),my_y(k)-my_y(i)])));
% % 
% %                  if ((theta1+theta2)> 40&&(theta1+theta2)< 140)
% %                      flag2 = 0;              
% %                  end
% %                  if flag==0&&flag2==0
% %                     my_n_x(count1) = my_x(k); count1 = count1+1;
% %                     my_n_y(count2) = my_y(k); count2 = count2+1; 
% %                  end
%            end
%        end 
%        
%     end
% end
% %num = lenght(my_n_x);
% 
% num = length(my_i);
% for n=1:num-1
%     for m=n+1:num
%         if(my_i(n)==my_i(m)&&my_j(n)==my_j(m))
%             line([my_n_x(n),my_n_y(n)],[my_n_x(m),my_n_y(m)]);
%             hold on;
%         end
%             if(my_j(n)==my_j(m)&&my_k(n)==my_k(m))
%                 line([my_n_x(n),my_n_y(n)],[my_n_x(m),my_n_y(m)]);
%                 hold on;
%             end
%            
% %             if((my_i(n)==my_i(m)&&my_k(n)==my_k(m))
% %                 line([my_n_x(n),my_n_y(n)],[my_n_x(m),my_n_y(m)]);
% %             end
%        
%     end
% end
% 
% hold off;
% 

%plot(my_n_x,my_n_y)

