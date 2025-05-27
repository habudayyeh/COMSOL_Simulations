%Script
clear all
L_wg=0;
theta=-pi/2:0.01:3*pi/2;
theta2=0:0.01:pi;
[x,y]=pol2cart(theta,ones(1,length(theta)));
theta=theta-pi/2;
Efar=zeros(length(L_wg),length(theta));
Coll_eff=zeros(length(L_wg),length(theta2));

for i1=1:1:length(L_wg)
    model(i1)=free_space;
    %model(i1)=above_metal;
    Efar(i1,:)=mphinterp(model(i1),'emw.normEfar','Coord',[x;y]);

    clear model
end
[~,index]=max(max(Efar,[],2));
figure;
polar(theta,Efar(index,:))
leg{index,1}=sprintf('%s %d','L_{wg}=',L_wg(index));
    hold on

for i2=1:1:length(L_wg)
    if i2 ~= index
        polar(theta,Efar(i2,:))
        leg{i2,1}=sprintf('%s %d','L_{wg}=',L_wg(i2));
        hold on
    end
end
    hold off;
    legend(leg)
I=Efar.^2;
NA=sin(theta2);
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
    figure;
