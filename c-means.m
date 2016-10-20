% C-means
clear all
clc;
%% make random data and make random center
tic
p=randi(100,1000,2);
[size1,size2]=size(p);
newcenter=randi(100,8,2);
center=zeros(8,2);
%% C-means
k=0;
% while(sum(sum(newcenter))~=sum(sum(center)))                % check for calss center change
while(k<1000)                                                 % check for ittiration number  
    u=zeros(8,size1);
    center=newcenter;
    clear newcenter;
    clear centerx;
    clear centery;
    k=k+1;
    for i=1:8
        for j=1:size1
            for l=1:8
                u(i,j)=u(i,j)+(((p(j,1)-center(i,1))^2 + (p(j,2)-center(i,2))^2)/((p(j,1)-center(l,1))^2 + (p(j,2)-center(l,2))^2))^2;
            end
            u(i,j)=u(i,j)^(-1);
        end
    end
    for i=1:8
        sumx=0;
        sumy=0;
        sumu=0;
        for j=1:size1
            sumx = sumx + u(i,j)^2 *p(j,1);
            sumy = sumy + u(i,j)^2 *p(j,2);
            sumu = sumu + u(i,j)^2;
        end
    centerx(i,1)=sumx/sumu;
    centery(i,1)=sumy/sumu;
    end
    newcenter=[centerx centery];
end
%% assign label for ech data
for j=1:size1
    temp=zeros(size1,8);
    for i=1:8
        if u(i,j)>temp(1,1)
            temp=[u(i,j),i];
        end
    end
    p(j,3)=temp(1,2);
end    
time = toc
%% plot
scatterplot(p)
disp(' k-means with initials RandomClass')

