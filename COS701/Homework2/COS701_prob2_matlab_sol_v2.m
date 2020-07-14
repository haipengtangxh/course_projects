m = 20;
a_max = 10;
x_max = 20;
Ai = zeros(1,m);
xi = zeros(1,m);
for i=1:m
    Ai(i) = rand() * a_max;
    xi(i) = rand() * x_max;
end

%x = 0:0.01:0.99;
n = numel(xi);
y = zeros(1,n);
for i=1:n
   %if(x(j) >= xi(i) && x(j) <=xi(i+1))
        y(i) = Ai(i);
   %end
end

figure(1)
subplot(3,1,1);stem(y); xlabel('x'); ylabel('y');

AreaY = trapz(y);

esp=0.1;
h11 = zeros(1,n);
for i=1:n
    h11(i) = h11(i) + (Ai(i) / pi) * (esp / ( (xi(i)^2 + esp^2) ));
end

subplot(3,1,2);
stem(h11); xlabel('x'); ylabel('Cauchy - epsilon=0.1');

AreaH11 = trapz(h11);

conv11 = conv(y,h11);
subplot(3,1,3);
stem(conv11); xlabel('x1'); ylabel('conv11');

AreaConv11 = trapz(conv11);

%%H12 - Conv12%%
figure(2)
subplot(3,1,1);
stem(y);xlabel('x');ylabel('y');

esp=0.01;
h12 = zeros(1,n);
for i=1:n
    h12(i) = h12(i) + (Ai(i) / pi) * (esp / ( (xi(i)^2 + esp^2) ));
end

subplot(3,1,2);
stem(h12);xlabel('x'); ylabel('Cauchy - epsilon=0.01');

AreaH12 = trapz(h12);

conv12 = conv(y,h12);
subplot(3,1,3);
stem(conv12); xlabel('x1'); ylabel('conv12');

AreaConv12 = trapz(conv12);

%%H13 - Conv13%%
figure(3)
subplot(3,1,1);
stem(y);xlabel('x');ylabel('y');

esp=0.001;
h13 = zeros(1,n);
for i=1:n
    h13(i) = h13(i) + (Ai(i) / pi) * (esp / ( (xi(i)^2 + esp^2) ));
end

subplot(3,1,2);
stem(h13); xlabel('x'); ylabel('Cauchy - epsilon=0.001');

AreaH13 = trapz(h13);

conv13 = conv(y,h13);
subplot(3,1,3);
stem(conv13,'markerfacecolor',[0 0 1]); xlabel('x1'); ylabel('conv13');

AreaConv13 = trapz(conv13);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure(4)
subplot(3,1,1);
stem(y); xlabel('x'); ylabel('y');

sigma=1;
%h21 = Ai * normpdf(xi, 0, sigma);
h21 = zeros(1,n);
for i=1:n    
	h21(i) = h21(i) + (Ai(i) / sqrt(2*pi*sigma^2)) * exp(-(xi(i)^2)/(sigma^2));    
end

subplot(3,1,2);
stem(h21); xlabel('x'); ylabel('Gaussian - sigma = 0.1');

AreaH21 = trapz(h21);

conv21 = conv(y,h21);
subplot(3,1,3);
stem(conv21,'markerfacecolor',[0 0 1]);
xlabel('x2'); ylabel('conv21');

AreaConv21 = trapz(conv21);

figure(5)
subplot(3,1,1);
stem(y); xlabel('x'); ylabel('y');

sigma=0.5;
%h22 = Ai * normpdf(xi, 0, sigma);
h22 = zeros(1,n);
for i=1:n    
	h22(i) = h22(i) + (Ai(i) / sqrt(2*pi*sigma^2)) * exp(-(xi(i)^2)/(sigma^2));    
end

subplot(3,1,2);
stem(h22); xlabel('x'); ylabel('Gaussian - sigma = 0.01');

AreaH22 = trapz(h22);

conv22 = conv(y,h22);
subplot(3,1,3);
stem(conv22,'markerfacecolor',[0 0 1]);
xlabel('x2'); ylabel('conv22');

AreaConv22 = trapz(conv22);

figure(6)
subplot(3,1,1);
stem(y); xlabel('x'); ylabel('y');

sigma=0.1;
%h23 = Ai * normpdf(xi, 0, sigma);
h23 = zeros(1,n);
for i=1:n    
	h23(i) = h23(i) + (Ai(i) / sqrt(2*pi*sigma^2)) * exp(-(xi(i)^2)/(sigma^2));    
end

subplot(3,1,2);
stem(h23); xlabel('x'); ylabel('Gaussian - sigma = 0.001');

AreaH23 = trapz(h23);

conv23 = conv(y,h23);
subplot(3,1,3);
stem(conv23,'markerfacecolor',[0 0 1]);
xlabel('x2'); ylabel('conv23');

AreaConv23 = trapz(conv23);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
error11 = AreaConv11 - AreaY*AreaH11;
error12 = AreaConv12 - AreaY*AreaH12;
error13 = AreaConv13 - AreaY*AreaH13;
error21 = AreaConv21 - AreaY*AreaH21;
error22 = AreaConv22 - AreaY*AreaH22;
error23 = AreaConv23 - AreaY*AreaH23;

%%%%%%%%%%%%%%%%% HISTOGRAM COMPARE %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure(7)
subplot(1,4,1);
hist(y);
subplot(1,4,2);
hist(conv11);
subplot(1,4,3);
hist(conv12);
subplot(1,4,4);
hist(conv13);
