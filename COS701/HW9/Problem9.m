


n=50;
%%%%%%%%generate guassian points
mu = [2 3];
SIGMA = [1 0; 0 2];
r = mvnrnd(mu,SIGMA,n);
%plot(r(:,1),r(:,2),'r*');
X = r;
hold on;

mu = [7 8];
SIGMA = [ 1 0; 0 2];
r2 = mvnrnd(mu,SIGMA,n);
%plot(r2(:,1),r2(:,2),'r*')
X = [X;r2];
hold on;

mu = [10 20];
SIGMA = [ 1 0; 0 2];
r3 = mvnrnd(mu,SIGMA,n);
%plot(r3(:,1),r3(:,2),'r*')
X = [X;r3];
hold on;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

k = 3; % number of centers



n = size(X, 1); %  
m = size(X, 2); %  

% select k centers
M = X(1:k, :);  

loop = 0;
while true
    % 2. get every distance between every vector and center
    DIST = zeros(n, k); 
    for i = 1:n
        for j = 1:k
            DIST(i, j) = norm(X(i, :) - M(j, :)); 
        end
    end
    [~, IDX] = min(DIST, [], 2); % IDX is the minimum index 

    % 3. recaculate then center of every cluster
    C = zeros(k, m); % new enter of cluster
    count = zeros(k, 1); % count the points in cluster
    for i = 1:n
        idx = IDX(i); %  
        count(idx) = count(idx) + 1; 
        C(idx, :) = C(idx, :) + X(i, :);
    end
    for i = 1:k
        C(i, :) = C(i, :) / count(i); % new center from C()
    end

    loop = loop + 1;                                                                
    % 4. interate 2~3 
    residual = norm(M - C); % distance between new center and old center
    disp(['distance between new center and old center is' , num2str(residual)])
    if residual < 1e-5
        break;
    end
    M = C; %   
end

plot(X(:,1), X(:,2),'r*')
hold on
plot(C(:,1), C(:,2), 'bo')
title('clustering result')
hold off