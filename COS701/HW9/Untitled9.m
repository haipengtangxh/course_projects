
n=50;
%%%%%%%%generate guassian points
mu = [2 3];
SIGMA = [1 0; 0 2];
r = mvnrnd(mu,SIGMA,n);
plot(r(:,1),r(:,2),'r*');
x = r;
hold on;

mu = [7 8];
SIGMA = [ 1 0; 0 2];
r2 = mvnrnd(mu,SIGMA,n);
plot(r2(:,1),r2(:,2),'r*')
x = [x;r2];
hold on;

mu = [10 20];
SIGMA = [ 1 0; 0 2];
r3 = mvnrnd(mu,SIGMA,n);
plot(r3(:,1),r3(:,2),'r*')
x = [x;r3];
hold on;
% 
% mu = [5 30];
% SIGMA = [ 1 0; 0 2];
% r4 = mvnrnd(mu,SIGMA,n);
% plot(r4(:,1),r4(:,2),'r*')
% x = [x;r4];
% hold on;
% 
% mu = [2.5 18];
% SIGMA = [ 1 0; 0 2];
% r5 = mvnrnd(mu,SIGMA,n);
% plot(r5(:,1),r5(:,2),'r*')
% x = [x;r5];
% hold on;






%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%




time=0;
k=2;
z=x(1:k,1:2);
z1=zeros(k,2);
while time<=1000
    count=zeros(k,1);  
    allsum=zeros(k,2);  
    num=[];  
    temp=[];  
    sum(1,1)=0;
    for i=1:size(x,1)
        for j=1:k
        temp(j,1)=sqrt((z(j,1)-x(i,1)).^2+(z(j,2)-x(i,2)).^2);
        temp(j,2)=j;
        end
        temp=sortrows(temp,1);  
        c=temp(1,2);       
        if temp(k,1)>sum(1,1)  
            sum(1,1)=temp(k,1);
            sum(1,2)=temp(k,2); 
        end
        count(c)=count(c)+1;   
        num(c,count(c))=i;
        allsum(c,1)=allsum(c,1)+x(i,1); 
        allsum(c,2)=allsum(c,2)+x(i,2); 
    end
    for i=1:k
        if count(i)~=0
    z1(i,1)=allsum(i,1)./count(i);  
    z1(i,2)=allsum(i,2)./count(i);
        else 
            z1(i,1)=x(sum(1,2),1);
            z1(i,2)=x(sum(1,2),2);
        end
    end
% z1(:,1)=allsum(:,1)./count(:);
% z1(:,2)=allsum(:,2)./count(:);
    if (z==z1)  
        break;
    else
       lz=z1;
    end
    time=time+1
end
% plot(x(:,1),x(:,2),'r*');
% hold on;
plot(z1(:,1),z1(:,2),'bo');




%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% 
% k=5;X=x;
% 
% n = size(X, 1); % ????
% m = size(X, 2); % ????
% 
% % 1.?nums??????k???????
% M = X(1:k, :); % ???k????????
% 
% loop = 0;
% while true
%     % 2. ????????????????????????????????
%     DIST = zeros(n, k); % DIST????????????
%     for i = 1:n
%         for j = 1:k
%             DIST(i, j) = norm(X(i, :) - M(j, :)); % ?????????????
%         end
%     end
%     [~, IDX] = min(DIST, [], 2); % IDX?????????????????????????????
% 
%     % 3. ???????????????
%     C = zeros(k, m); % C????????????
%     count = zeros(k, 1); % count???????????
%     for i = 1:n
%         idx = IDX(i); % idx?????
%         count(idx) = count(idx) + 1; % ?????????
%         C(idx, :) = C(idx, :) + X(i, :);
%     end
%     for i = 1:k
%         C(i, :) = C(i, :) / count(i); % ??C?????????
%     end
% 
%     loop = loop + 1;
%     disp(['?' , num2str(loop) , '???'])
%     % 4. ??2~3?????????????????????????
%     residual = norm(M - C); % ?????????????
%     disp(['????????????' , num2str(residual)])
%     if residual < 1e-5
%         break;
%     end
%     M = C; % ?????????????????????????
% end


