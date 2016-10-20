% K-means with random class estimated for ech data
clear all
clc;
%% make random data and set random class for ech data 
tic
p=randi(100,1000,2);
classlevel=randi(8,1000,1);
p=[p classlevel];
center=zeros(8,2);
%% calculate initial center for ech class
k=1;
for j=1:8
    clear temp;
    sumx=0;
    sumy=0;
    temp=find(p(:,3)==j);
    for i=1:size(temp,1)
        sumx=sumx+p(temp(i),1);
        sumy=sumy+p(temp(i),2);
    end
    centerx(j,1)=sumx/size(temp,1);
    centery(j,1)=sumy/size(temp,1);
end
newcenter=[centerx centery];
%% k-means
while(newcenter-center)
    center=newcenter;
    clear newcenter;
    clear centerx;
    clear centery;
    k=k+1;
    for i=1:1000
        mindist=1000;
        for j=1:8
            dist(j)=sqrt((p(i,1)-center(j,1))^2 + (p(i,2)-center(j,2))^2);
            if dist(j)<mindist
                mindist =dist(j);
                p(i,3)=j;
            end
        end
    end
    for j=1:8
        clear temp;
        sumx=0;
        sumy=0;
        temp=find(p(:,3)==j);
        for i=1:size(temp,1)
            sumx=sumx+p(temp(i),1);
            sumy=sumy+p(temp(i),2);
        end
        centerx(j,1)=sumx/size(temp,1);
        centery(j,1)=sumy/size(temp,1);
        if size(temp,1)==0
            centerx(j,1)=0;
            centery(j,1)=0;
        end
    end
    newcenter=[centerx centery];
end
Time=toc()
%% plot
scatterplot(p)
disp(' k-means with initials RandomClass')
Ittiration=k
