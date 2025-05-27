%Script
clear all
clc
x1=400;
x2=1000;
x3=1600;
x4=2380;
par=0:15:90;
theta=-pi/2:0.01:3*pi/2;
theta2=0:0.01:pi;
[x,y]=pol2cart(theta,ones(1,length(theta)));
theta=theta-pi/2;
Efar=zeros(length(par),length(theta));
Coll_eff=zeros(length(par),length(theta2));
for i1=1:1:length(par)

    model=model(x1,x2,x3,x4,par(i1));
    Efar(i1,:)=mphinterp(model,'emw.normEfar','Coord',[x;y]);
    clear model
end


 [~,index]=max(max(Efar,[],2));
 figure;
polar(theta,Efar(index,:))
leg{index,1}=sprintf('%s %d','\alpha=',par(index));
    hold on

for i2=1:1:length(par)
    if i2 ~= index
        polar(theta,Efar(i2,:))
        leg{i2,1}=sprintf('%s %d','\alpha=',par(i2));
        hold on
    end
end
    hold off;
    legend(leg)
I=Efar.^2;
%NA=sin(theta2);
figure;

for i3=1:1:size(I,1);
    I_fit=fit(theta',I(i3,:)','cubicinterp');
    Coll_eff(i3,:)=integrate(I_fit,theta2,0)-integrate(I_fit,-theta2,0);
    plot(sin(theta2),Coll_eff(i3,:)./max(Coll_eff(i3,:)));
    hold on;
end
    legend(leg)
    xlabel('NA')
    ylabel('Coup. Eff.')
    hold off;
SM_coll_eff=Coll_eff(:,13)./max(Coll_eff,[],2);
MM_coll_eff=Coll_eff(:,28)./max(Coll_eff,[],2);
[par',SM_coll_eff,MM_coll_eff]

