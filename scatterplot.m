function scatterplot(p)
    color=find(p(:,3)==1);
    scatter(p(color(1:end),1),p(color(1:end),2),'y')
    hold on
    color=find(p(:,3)==2);
    scatter(p(color(1:end),1),p(color(1:end),2),'m')
    color=find(p(:,3)==3);
    scatter(p(color(1:end),1),p(color(1:end),2),'c')
    color=find(p(:,3)==4);
    scatter(p(color(1:end),1),p(color(1:end),2),'r')
    color=find(p(:,3)==5);
    scatter(p(color(1:end),1),p(color(1:end),2),'g')
    color=find(p(:,3)==6);
    scatter(p(color(1:end),1),p(color(1:end),2),'b')
    color=find(p(:,3)==7);
    scatter(p(color(1:end),1),p(color(1:end),2),'r')
    color=find(p(:,3)==8);
    scatter(p(color(1:end),1),p(color(1:end),2),'k')
end