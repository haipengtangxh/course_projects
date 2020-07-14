%2a

X = 0+20*rand(1,10);

A = 0+50*rand(1,10);
figure(1)
subplot(4,3,1)
stem(A)
%histogram(X,A)
Y=A;
AreaY = trapz(Y);

%2b
e = 1;
    
for n=1:10
    
    t_x = X(1,n).^2 + e.^2;
    t2_x = pi*t_x;
    t3_x = 1/(t2_x);
    y(n)= t3_x;
end

Area_1 = trapz(y);

subplot(4,3,4);
stem(y); ylabel('e = 1');
subplot(4,3,7);
my1=conv(y,A)
stem(my1); ylabel('convolution_1');
Area_c_1 = trapz(my1);

error1 = Area_c_1 - AreaY*Area_1;




%%%%%%%%%%%%%%%%%%
e = 0.1;

  
for n=1:10
    t_x = X(1,n).^2 + e.^2;
    t2_x = pi*t_x;
    t3_x = 1/(t2_x);
    y2(n)= t3_x; 
end
Area_2 = trapz(y2);

subplot(4,3,5)
stem(y2); ylabel('e = 0.1');
subplot(4,3,8);
my2=conv(y2,A);
stem(my2); ylabel('convolution_2');
Area_c_2 = trapz(my2);
error2 = Area_c_2 - AreaY*Area_2;

%%%%%%%%%%%%%%%%%%%%%%%%%%
e = 0.01;
for n=1:10
    t_x = X(1,n).^2 + e.^2;
    t2_x = pi*t_x;
    t3_x = 1/(t2_x);
    y3(n)= t3_x; 
end
Area_3 = trapz(y3);

subplot(4,3,6)
stem(y3); ylabel('e = 0.01');
   
my3=conv(y3,A);

subplot(4,3,9)
stem(my3); ylabel('convolution_3');
Area_c_3 = trapz(my3);
error3 = Area_c_3 - AreaY*Area_3;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure(2)
subplot(4,3,1)
stem(A)
%2c
sigma = 1 
for n=1:10 
    t_x =  X(1,n).^2/sigma.^2;
    t2_x = exp(-1*t_x);
    t3_x = sqrt(1/(2*pi*sigma.^2));
    t4_x = t2_x*t3_x;
    y4(n)=t4_x;
end
Area_4 = trapz(y4);
subplot(4,3,4)
stem(y4);ylabel('sigma = 1');
my4=conv(y4,A);
subplot(4,3,7);

stem(my4); ylabel('convolution_1');
Area_c_4 = trapz(my4);
error4 = Area_c_4 - AreaY*Area_4;

%%%%%%%%%%%%%%%%%%%%
sigma = 0.5 
for n=1:10 
    t_x =  X(1,n).^2/sigma.^2;
    t2_x = exp(-1*t_x);
    t3_x = sqrt(1/(2*pi*sigma.^2));
    t4_x = t2_x*t3_x;
    y5(n)=t4_x;
end
Area_5 = trapz(y5);


subplot(4,3,5)
stem(y5);ylabel('sigma = 0.5');
my5=conv(y5,A);
subplot(4,3,8);

stem(my5); ylabel('convolution_2');

Area_c_5 = trapz(my5);
error5 = Area_c_5 - AreaY*Area_5;

%%%%%%%%%%%%%%%%%%%%%%%
sigma = 0.1 
for n=1:10 
    t_x =  X(1,n).^2/sigma.^2;
    t2_x = exp(-1*t_x);
    t3_x = sqrt(1/(2*pi*sigma.^2));
    t4_x = t2_x*t3_x;
    y6(n)=t4_x;
end
Area_6 = trapz(y6);
subplot(4,3,6)
stem(y6);ylabel('sigma = 0.1');
my6=conv(y6,A);
subplot(4,3,9);

stem(my6); ylabel('convolution_3');
Area_c_6 = trapz(my6);
error6 = Area_c_6 - AreaY*Area_6;


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Error %%%%%

% subplot(4,3,2);
% hist(y);
% subplot(1,4,2);
% hist(conv11);
% subplot(1,4,3);
% hist(conv12);
% subplot(1,4,4);
% hist(conv13);





