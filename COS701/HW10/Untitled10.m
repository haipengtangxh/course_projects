% I=meshgrid(100,100);
% 
% plot(x,meshgrid(y,x),'k')
% hold on
% plot(meshgrid(x,y),y,'k')


% 
% [X,Y] = meshgrid(-2:.2:2, -2:.2:2);
% 
% Z = X .* exp(-X.^2 - Y.^2);
% 
% mesh(X,Y,Z) 
clear;

N=30;
x=1:N;
y=1:N;
[X,Y]=meshgrid(x,y);

%%%%%%%%%%%%%%%%%%%%%%%%%%

figure;

p=0.6;


plot(X,Y,'b');
hold on;
plot(X',Y','b');
hold on;

lattice = zeros(N,N);

t_N = ceil(N*N*p)
for i = 1: t_N
    l_x(i)=unidrnd(N);
    l_y(i)=unidrnd(N);
    lattice(l_x(i),l_y(i))=1;
end
lattice = lattice';
lattice = flipud(lattice);
plot(l_x,l_y,'or');
hold on;

figure;
CC = bwconncomp(lattice,4)
L_n = cellfun(@length,CC.PixelIdxList)
hist(L_n,unique(L_n));


flag = 0;
flag2 = 0;
[max_size,max_index] = max(cellfun('size',CC.PixelIdxList,1));

max_l_array = CC.PixelIdxList(max_index)
border_values_up = 1:N:(N*(N-1)+1);
border_values_down = N:N:N*N;
temp = max_l_array{1};
for i = 1:max_size
    if   ismember(temp(i,1),border_values_up)
        flag = 1;
    end
    if ismember(temp(i,1),border_values_down)
        flag2=1;
    end
end

if (flag==1&&flag==1)
    result = 'there is a percolating cluster'
else
    result = 'there is no percolating cluster'
end


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure;

for t_i= 1:9
p = 0.1*t_i

% subplot(2,5,t_i);
% plot(X,Y,'b');
% hold on;
% plot(X',Y','b');
% hold on;

lattice = zeros(N,N);

t_N = ceil(N*N*p)
for i = 1: t_N
    l_x(i)=unidrnd(N);
    l_y(i)=unidrnd(N);
    lattice(l_x(i),l_y(i))=1;
end
lattice = lattice';
lattice = flipud(lattice);
% plot(l_x,l_y,'or');
% hold on;

CC = bwconncomp(lattice,4)
L_n = cellfun(@length,CC.PixelIdxList)
subplot(2,5,t_i);
hist(L_n,unique(L_n));
end












%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



figure;

p=0.9;
total_count = (p-0.1)*100;
 result_count1=0;
 result_count0=0;

for j=0.1:0.01:p  %step = 0.01

%     plot(X,Y,'b');
%     hold on;
%     plot(X',Y','b');
%     hold on;
   

    lattice = zeros(N,N);

    t_N = ceil(N*N*p)
    for i = 1: t_N
        l_x(i)=unidrnd(N);
        l_y(i)=unidrnd(N);
        lattice(l_x(i),l_y(i))=1;
    end
    lattice = lattice';
    lattice = flipud(lattice);
%     plot(l_x,l_y,'or');
%     hold on;

    %figure;
    CC = bwconncomp(lattice,4)
    L_n = cellfun(@length,CC.PixelIdxList)
%     hist(L_n,unique(L_n));


    flag = 0;
    flag2 = 0;
    [max_size,max_index] = max(cellfun('size',CC.PixelIdxList,1));

    max_l_array = CC.PixelIdxList(max_index)
    border_values_up = 1:N:(N*(N-1)+1);
    border_values_down = N:N:N*N;
    temp = max_l_array{1};
    for i = 1:max_size
        if   ismember(temp(i,1),border_values_up)
            flag = 1;
        end
        if ismember(temp(i,1),border_values_down)
            flag2=1;
        end
    end

    if (flag==1&&flag==1)
        result = 'there is a percolating cluster'
        result_count1 = result_count1+1;
    else
        result = 'there is no percolating cluster'
        result_count0 = result_count0+1;
    end
    pc(i*10) = result_count1/total_count;
    
end
                                                                                                                                                                                                           pc=sort(pc);
plot(pc,'o');



