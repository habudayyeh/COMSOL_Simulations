%Script
clear all
Period=480;
Main=900;
SlitHeight=100;%[nm]
ElementWidth=150;%[nm]
PolymerThickness=300;
theta=-pi/2:0.01:3*pi/2;
theta2=0:0.01:pi;
[x,y]=pol2cart(theta,ones(1,length(theta)));
theta=theta-pi/2;
Efar=zeros(length(Period),length(theta));
Coll_eff=zeros(length(Period),length(theta2));
for i1=1:1:length(Main)
    model=model(Main(i1),Period,SlitHeight,ElementWidth,PolymerThickness);
    Efar(i1,:)=mphinterp(model,'emw.normEfar','Coord',[x;y]);
    clear model
end
%     model=model(1480,750);
%     Efar(i1,:)=mphinterp(model,'emw.normEfar','Coord',[x;y]);
[~,index]=max(max(Efar,[],2));
figure;
polar(theta,Efar(index,:))
leg{index,1}=sprintf('%s %d','Par=',Main(index));
    hold on

for i2=1:1:length(Main)
    if i2 ~= index
        polar(theta,Efar(i2,:))
        leg{i2,1}=sprintf('%s %d','Par=',Main(i2));
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
    plot(theta2,Coll_eff(i3,:));
    hold on;
end
    legend(leg)
    xlabel('\theta [rad]')
    ylabel('Unnormalized Coup. Eff.')
    hold off;

