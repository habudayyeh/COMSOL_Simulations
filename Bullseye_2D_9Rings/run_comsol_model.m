%Script
%% Initialize Variables
clear all
clc
theta=-pi/2:0.01:3*pi/2;
theta2=0:0.01:pi;
[x,y]=pol2cart(theta,ones(1,length(theta)));
theta=theta-pi/2;

%% Run Model From Comsol
    model=Bullseye_Design_2D_center_flat_low;
    Efar=mphinterp(model,'emw.normEfar','Coord',[x;y]);
    clear model

%% Plot Far Field E
figure;
polar(theta,Efar.^2./max(Efar.^2))
I=Efar.^2;
hold on

%% Calculate and plot collection effeciency
    I_fit=fit(theta',I','cubicinterp');
    Coll_eff=integrate(I_fit,theta2,0)-integrate(I_fit,-theta2,0);
    
    figure;
    plot(theta2,Coll_eff./max(Coll_eff));
    xlabel('\theta[rad]')
    xlim([0,pi/2])
    ylabel('Coup. Eff.')
    hold on
    
    
    
SM_coll_eff=Coll_eff(13)./max(Coll_eff);
MM_coll_eff=Coll_eff(28)./max(Coll_eff);

