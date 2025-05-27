%Script
clear all
clc;
n=10;
theta=-pi/2:0.01:3*pi/2;
theta2=0:0.01:pi;
phi=-pi/2:pi/(2*n):pi/2;

[x_prime,y]=pol2cart(theta,ones(1,length(theta)));
theta=theta-pi/2;
Efar=zeros(length(phi),length(theta));
% Coll_eff=zeros(length(L_wg),length(theta2));

for i1=1:1:length(phi)
    model=freespace(phi(i1));
    %model(i1)=above_metal;
    Efar(i1,:)=mphinterp(model,'emw.normEfar','Coord',[x_prime;y]);
    clear model
end
[THETA,PHI]=meshgrid(theta,phi);
EfarX=Efar.*sin(PHI).*sin(THETA);
EfarZ=Efar.*cos(PHI).*sin(THETA);
EfarY=Efar.*cos(THETA);
surf(EfarX,EfarY,EfarZ);
xlabel('x');
ylabel('y');
zlabel('z');
